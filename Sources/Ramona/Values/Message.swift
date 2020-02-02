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
  case songSelect(index: DataByte)
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
        channel: c.asChannel,
        note: Note(data.firstByte()),
        velocity: Velocity(data.secondByte())
      )
    case (.noteOn, let c?):
      try self = .noteOn(
        channel: c.asChannel,
        note: Note(data.firstByte()),
        velocity: Velocity(data.secondByte())
      )
    case (.polyKeyPressure, let c?):
      try self = .polyKeyPressure(
        channel: c.asChannel,
        note: Note(data.firstByte()),
        pressure: Pressure(data.secondByte())
      )
    case (.controlChange, let c?):
      try self = .controlChange(
        channel: c.asChannel,
        control: ControlChange(controlType: data.firstByte(), data: data.secondByte())
      )
    case (.programChange, let c?):
      try self = .programChange(
        channel: c.asChannel,
        program: Program(data.secondByte())
      )
    case (.channelPressure, let c?):
      try self = .channelPressure(
        channel: c.asChannel,
        pressure: Pressure(data.firstByte())
      )
    case (.pitchBend, let c?):
      try self = .pitchBend(
        channel: c.asChannel,
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
      try self = .songSelect(index: data.firstByte())
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
  
  
  var data: Data {
    switch self {
    case let .noteOff(channel: c, note: n, velocity: v):
      let status = StatusByte(messageType: .noteOff, channel: c)
      return Data(byte1: status.byte, byte2: n.byte, byte3: v.byte)
      
    case let .noteOn(channel: c, note: n, velocity: v):
      let status = StatusByte(messageType: .noteOn, channel: c)
      return Data(byte1: status.byte, byte2: n.byte, byte3: v.byte)

    case let .polyKeyPressure(channel: c, note: n, pressure: p):
      let status = StatusByte(messageType: .polyKeyPressure, channel: c)
      return Data(byte1: status.byte, byte2: n.byte, byte3: p.byte)

      
    case let .controlChange(channel: c, control: cc):
      let status = StatusByte(messageType: .controlChange, channel: c)
      return Data(byte: status.byte) + cc.data

      
    case let .programChange(channel: c, program: p):
      let status = StatusByte(messageType: .programChange, channel: c)
      return Data(byte1: status.byte, byte2: p.byte)

    case let .channelPressure(channel: c, pressure: p):
      let status = StatusByte(messageType: .channelPressure, channel: c)
      return Data(byte1: status.byte, byte2: p.byte)

    case let .pitchBend(channel: c, change: pc):
      let status = StatusByte(messageType: .pitchBend, channel: c)
      var buf = Data(byte: status.byte)
      buf.append(pc.data)
      return buf

    case let .timeCodeQuarterFrame(fragment: f):
      return Data(byte1: StatusByte(systemType: .timeCodeQuarterFrame).byte, byte2: f.byte)
      
    case let .songPositionPointer(beatCount: b):
      return Data(byte: StatusByte(systemType: .songPositionPointer).byte) + b.data
      
    case let .songSelect(index: i):
      return Data(byte1: StatusByte(systemType: .songSelect).byte, byte2: i.byte)
      
    case .tuneRequest:
      return Data(byte: StatusByte(systemType: .tuneRequest).byte)
      
    case .timingClock:
      return Data(byte: StatusByte(systemType: .timingClock).byte)
      
    case .start:
      return Data(byte: StatusByte(systemType: .start).byte)
      
    case .`continue`:
      return Data(byte: StatusByte(systemType: .continue).byte)
      
    case .stop:
      return Data(byte: StatusByte(systemType: .stop).byte)
      
    case .activeSensing:
      return Data(byte: StatusByte(systemType: .activeSensing).byte)
      
    case .systemReset:
      return Data(byte: StatusByte(systemType: .systemReset).byte)
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
