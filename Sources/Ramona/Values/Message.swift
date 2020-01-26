import Foundation
import CoreMIDI



public enum Message {
  case noteOff(channel: Channel, note: Note, velocity: Velocity)
  case noteOn(channel: Channel, note: Note, velocity: Velocity)
  case polyKeyPressure(channel: Channel, note: Note, pressure: Pressure)
  case controlChange(channel: Channel, control: ControlChange)
  case programChange(channel: Channel, program: Program)
  case channelPressure(channel: Channel, pressure: Pressure)
  case pitchBend(channel: Channel, change: PitchChange)
  case timeCodeQuarterFrame(fragment: SMPTEFragment)
  case songPositionPointer(beatCount: Beats)
  case songSelect(index: Int)
  case tuneRequest
  case timingClock
  case start
  case `continue`
  case stop
  case activeSensing
  case systemReset
  
  
  internal init(status: StatusByte, data: [DataByte]) throws {
    switch (status.topNibble, status.bottomNibble) {
    case (0b000, let c):
      try self = .noteOff(
        channel: Channel(nibble: c),
        note: Note(data.firstByte()),
        velocity: Velocity(data.secondByte())
      )
    case (0b001, let c):
      try self = .noteOn(
        channel: Channel(nibble: c),
        note: Note(data.firstByte()),
        velocity: Velocity(data.secondByte())
      )
    case (0b010, let c):
      try self = .polyKeyPressure(
        channel: Channel(nibble: c),
        note: Note(data.firstByte()),
        pressure: Pressure(data.secondByte())
      )
    case (0b011, let c):
      try self = .controlChange(
        channel: Channel(nibble: c),
        control: ControlChange(controlType: data.firstByte(), data: data.secondByte())
      )
    case (0b100, let c):
      try self = .programChange(
        channel: Channel(nibble: c),
        program: Program(data.secondByte())
      )
    case (0b101, let c):
      try self = .channelPressure(
        channel: Channel(nibble: c),
        pressure: Pressure(data.firstByte())
      )
    case (0b110, let c):
      try self = .pitchBend(
        channel: Channel(nibble: c),
        change: PitchChange(lsb: data.firstByte(), msb: data.secondByte())
      )
    case (0b111, 0b0000):
      #warning("need to implement sysex")
      fatalError("sysex")
    case (0b111, 0b0001):
      try self = .timeCodeQuarterFrame(fragment: SMPTEFragment(dataByte: data.firstByte()))
    case (0b111, 0b0010):
      try self = .songPositionPointer(beatCount: Beats(lsb: data.firstByte(), msb: data.secondByte()))
    case (0b111, 0b0011):
      try self = .songSelect(index: data.firstByte().value)
    case (0b111, 0b0100),
         (0b111, 0b0101):
      throw Error.undefined
    case (0b111, 0b0110):
      self = .tuneRequest
    case (0b111, 0b0111):
      #warning("Implement sysex")
      fatalError("end sysex")
    case (0b111, 0b1000):
      self = .timingClock
    case (0b111, 0b1001):
      throw Error.undefined
    case (0b111, 0b1010):
      self = .start
    case (0b111, 0b1011):
      self = .continue
    case (0b111, 0b1100):
      self = .stop
    case (0b111, 0b1101):
      throw Error.undefined
    case (0b111, 0b1110):
      self = .activeSensing
    case (0b111, 0b1111):
      self = .systemReset
    default:
      fatalError("Status type outside of 3-bit bounds")
    }
  }
}



public extension Message {
  enum Error: LocalizedError {
    case missingData
    case undefined
    
    public var errorDescription: String? {
      switch self {
      case .missingData:
        return "There is insufficiant data for this message."
      case .undefined:
        return "This message is left undefined by the MIDI spec."
      }
    }
  }
  
  
  //  var data: Data {
  //    switch self {
  //    case noteOff(channel: Channel, note: Note, velocity: Velocity)
  //    case noteOn(channel: Channel, note: Note, velocity: Velocity)
  //    case polyKeyPressure(channel: Channel, note: Note, pressure: Pressure)
  //    case controlChange(channel: Channel, control: ControlChange)
  //    case programChange(channel: Channel, program: Program)
  //    case channelPressure(channel: Channel, pressure: Pressure)
  //    case pitchBend(channel: Channel, change: PitchChange)
  //    case timeCodeQuarterFrame(fragment: SMPTEFragment)
  //    case songPositionPointer(beatCount: Beats)
  //    case songSelect(index: Int)
  //    case tuneRequest
  //    case timingClock
  //    case start
  //    case `continue`
  //    case stop
  //    case activeSensing
  //    case systemReset
  //    }
  //    #warning("not implemented")
  //    return Data()
  //  }
}


private extension Array where Element == DataByte {
  func firstByte() throws -> DataByte {
    guard let byte = first else {
      throw Message.Error.missingData
    }
    return byte
  }
  
  
  func secondByte() throws -> DataByte {
    guard count >= 2 else {
      throw Message.Error.missingData
    }
    return self[1]
  }
}
