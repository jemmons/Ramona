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
    switch status.messageType {
    case 0b000:
      try self = .noteOff(
        channel: Channel(status: status),
        note: Note(data.firstByte()),
        velocity: Velocity(data.secondByte())
      )
    case 0b001:
      try self = .noteOn(
        channel: Channel(status: status),
        note: Note(data.firstByte()),
        velocity: Velocity(data.secondByte())
      )
    case 0b010:
      try self = .polyKeyPressure(
        channel: Channel(status: status),
        note: Note(data.firstByte()),
        pressure: Pressure(data.secondByte())
      )
    case 0b011:
      try self = .controlChange(
        channel: Channel(status: status),
        control: ControlChange(controlType: data.firstByte(), data: data.secondByte())
      )
    case 0b100:
      try self = .programChange(
        channel: Channel(status: status),
        program: Program(dataByte: data.secondByte())
      )
    case 0b101:
      try self = .channelPressure(
        channel: Channel(status: status),
        pressure: Pressure(data.firstByte())
      )
    case 0b110:
      try self = .pitchBend(
        channel: Channel(status: status),
        change: PitchChange(lsb: data.firstByte(), msb: data.secondByte())
      )
    case 0b111:
      switch status.systemMessageType {
      case 0b0000:
        #warning("need to implement sysex")
        fatalError("sysex")
      case 0b0001:
        try self = .timeCodeQuarterFrame(fragment: SMPTEFragment(dataByte: data.firstByte()))
      case 0b0010:
        try self = .songPositionPointer(beatCount: Beats(lsb: data.firstByte(), msb: data.secondByte()))
      case 0b0011:
        try self = .songSelect(index: data.firstByte().value)
      case 0b0100,
           0b0101:
        throw Error.undefined
      case 0b0110:
        self = .tuneRequest
      case 0b0111:
        #warning("Implement sysex")
        fatalError("end sysex")
      case 0b1000:
        self = .timingClock
      case 0b1001:
        throw Error.undefined
      case 0b1010:
        self = .start
      case 0b1011:
        self = .continue
      case 0b1100:
        self = .stop
      case 0b1101:
        throw Error.undefined
      case 0b1110:
        self = .activeSensing
      case 0b1111:
        self = .systemReset
      default:
        fatalError("System message type outside of 4-bit bounds")
      }
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
