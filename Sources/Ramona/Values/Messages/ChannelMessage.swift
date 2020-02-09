import Foundation



public enum ChannelMessage {
  case noteOff(channel: Channel, note: Note, velocity: Velocity)
  case noteOn(channel: Channel, note: Note, velocity: Velocity)
  case polyKeyPressure(channel: Channel, note: Note, pressure: Pressure)
  case controlChange(channel: Channel, control: ControlChange)
  case programChange(channel: Channel, program: Program)
  case channelPressure(channel: Channel, pressure: Pressure)
  case pitchBend(channel: Channel, change: PitchChange)
  
  
  internal init(type: TopNibble, channel: Channel, data: MessageData) throws {
    switch type {
    case .systemMessage:
      #warning("throw something")
      fatalError("throw something")
    case .noteOff:
      try self = .noteOff(
        channel: channel,
        note: Note(data.firstByte()),
        velocity: Velocity(data.secondByte())
      )
    case .noteOn:
      try self = .noteOn(
        channel: channel,
        note: Note(data.firstByte()),
        velocity: Velocity(data.secondByte())
      )
    case .polyKeyPressure:
      try self = .polyKeyPressure(
        channel: channel,
        note: Note(data.firstByte()),
        pressure: Pressure(data.secondByte())
      )
    case .controlChange:
      try self = .controlChange(
        channel: channel,
        control: ControlChange(controlType: data.firstByte(), data: data.secondByte())
      )
    case .programChange:
      try self = .programChange(
        channel: channel,
        program: Program(data.secondByte())
      )
    case .channelPressure:
      try self = .channelPressure(
        channel: channel,
        pressure: Pressure(data.firstByte())
      )
    case .pitchBend:
      try self = .pitchBend(
        channel: channel,
        change: PitchChange(lsb: data.firstByte(), msb: data.secondByte())
      )
    default:
      preconditionFailure("Top nibble is not three bits.")
    }
  }
}



extension ChannelMessage: MultibyteConvertible {
  public var data: Data {
    switch self {
    case let .noteOff(channel: c, note: n, velocity: v):
      let status = StatusByte(top: .noteOff, bottom: c.nibble)
      return Data(byte1: status, byte2: n, byte3: v)
      
    case let .noteOn(channel: c, note: n, velocity: v):
      let status = StatusByte(top: .noteOn, bottom: c.nibble)
      return Data(byte1: status, byte2: n, byte3: v)
      
    case let .polyKeyPressure(channel: c, note: n, pressure: p):
      let status = StatusByte(top: .polyKeyPressure, bottom: c.nibble)
      return Data(byte1: status, byte2: n, byte3: p)
            
    case let .controlChange(channel: c, control: cc):
      let status = StatusByte(top: .controlChange, bottom: c.nibble)
      return Data(byte: status, data: cc)
      
    case let .programChange(channel: c, program: p):
      let status = StatusByte(top: .programChange, bottom: c.nibble)
      return Data(byte1: status, byte2: p)
      
    case let .channelPressure(channel: c, pressure: p):
      let status = StatusByte(top: .channelPressure, bottom: c.nibble)
      return Data(byte1: status, byte2: p)
      
    case let .pitchBend(channel: c, change: pc):
      let status = StatusByte(top: .pitchBend, bottom: c.nibble)
      return Data(byte: status, data: pc)
    }
  }
}
