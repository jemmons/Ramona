import Foundation



public enum SystemMessage {
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
  
  
  internal init(typeNibble: BottomNibble, data: MessageData) throws {
    switch typeNibble {
    case .systemExclusiveStart:
      #warning("need to implement sysex")
      fatalError("sysex")
    case .timeCodeQuarterFrame:
      try self = .timeCodeQuarterFrame(fragment: SMPTEFragment(dataByte: data.firstByte()))
    case .songPositionPointer:
      try self = .songPositionPointer(beatCount: Beats(lsb: data.firstByte(), msb: data.secondByte()))
    case .songSelect:
      try self = .songSelect(index: data.firstByte())
    case .tuneRequest:
      self = .tuneRequest
    case .systemExclusiveEnd:
      #warning("Implement sysex")
      fatalError("end sysex")
    case .timingClock:
      self = .timingClock
    case .start:
      self = .start
    case .continue:
      self = .continue
    case .stop:
      self = .stop
    case .activeSensing:
      self = .activeSensing
    case .systemReset:
      self = .systemReset
    default:
      throw Message.Error.undefined
    }
  }
}



extension SystemMessage: MultibyteConvertible {
  public var data: Data {
    switch self {
    case let .timeCodeQuarterFrame(fragment: f):
      return Data(byte1: StatusByte(top: .systemMessage, bottom: .timeCodeQuarterFrame), byte2: f)
      
    case let .songPositionPointer(beatCount: b):
      return Data(byte: StatusByte(top: .systemMessage, bottom: .songPositionPointer), data: b)
      
    case let .songSelect(index: i):
      return Data(byte1: StatusByte(top: .systemMessage, bottom: .songSelect), byte2: i)
      
    case .tuneRequest:
      return Data(byte: StatusByte(top: .systemMessage, bottom: .tuneRequest))
      
    case .timingClock:
      return Data(byte: StatusByte(top: .systemMessage, bottom: .timingClock))
      
    case .start:
      return Data(byte: StatusByte(top: .systemMessage, bottom: .start))
      
    case .`continue`:
      return Data(byte: StatusByte(top: .systemMessage, bottom: .continue))
      
    case .stop:
      return Data(byte: StatusByte(top: .systemMessage, bottom: .stop))
      
    case .activeSensing:
      return Data(byte: StatusByte(top: .systemMessage, bottom: .activeSensing))
      
    case .systemReset:
      return Data(byte: StatusByte(top: .systemMessage, bottom: .systemReset))
    }
  }
}
