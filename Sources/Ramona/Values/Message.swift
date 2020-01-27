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
    switch (status.messageType, status.systemType) {
    case (.noteOff, let c?):
      try self = .noteOff(
        channel: Channel(nibble: c.rawValue),
        note: Note(data.firstByte()),
        velocity: Velocity(data.secondByte())
      )
    case (.noteOn, let c?):
      try self = .noteOn(
        channel: Channel(nibble: c.rawValue),
        note: Note(data.firstByte()),
        velocity: Velocity(data.secondByte())
      )
    case (.polyKeyPressure, let c?):
      try self = .polyKeyPressure(
        channel: Channel(nibble: c.rawValue),
        note: Note(data.firstByte()),
        pressure: Pressure(data.secondByte())
      )
    case (.controlChange, let c?):
      try self = .controlChange(
        channel: Channel(nibble: c.rawValue),
        control: ControlChange(controlType: data.firstByte(), data: data.secondByte())
      )
    case (.programChange, let c?):
      try self = .programChange(
        channel: Channel(nibble: c.rawValue),
        program: Program(data.secondByte())
      )
    case (.channelPressure, let c?):
      try self = .channelPressure(
        channel: Channel(nibble: c.rawValue),
        pressure: Pressure(data.firstByte())
      )
    case (.pitchBend, let c?):
      try self = .pitchBend(
        channel: Channel(nibble: c.rawValue),
        change: PitchChange(lsb: data.firstByte(), msb: data.secondByte())
      )
    case (.systemMessage, .systemExclusiveStart):
      #warning("need to implement sysex")
      fatalError("sysex")
    case (.systemMessage, .timeCodeQuarterFrame):
      try self = .timeCodeQuarterFrame(fragment: SMPTEFragment(dataByte: data.firstByte()))
    case (.systemMessage, .songPositionPointer):
      try self = .songPositionPointer(beatCount: Beats(lsb: data.firstByte(), msb: data.secondByte()))
    case (.systemMessage, .songSelect):
      try self = .songSelect(index: data.firstByte().value)
    case (.systemMessage, .tuneRequest):
      self = .tuneRequest
    case (.systemMessage, .systemExclusiveEnd):
      #warning("Implement sysex")
      fatalError("end sysex")
    case (.systemMessage, .timingClock):
      self = .timingClock
    case (.systemMessage, .start):
      self = .start
    case (.systemMessage, .continue):
      self = .continue
    case (.systemMessage, .stop):
      self = .stop
    case (.systemMessage, .activeSensing):
      self = .activeSensing
    case (.systemMessage, .systemReset):
      self = .systemReset
    default:
      throw Error.undefined
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
