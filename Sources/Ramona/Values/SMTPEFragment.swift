import Foundation


public enum SMPTEFragment {
  case leastSignificantFrame(Int)
  case mostSignificantFrame(Int)
  case leastSignificantSecond(Int)
  case mostSignificantSecond(Int)
  case leastSignificantMinute(Int)
  case mostSignificantMinute(Int)
  case leastSignificantHour(Int)
  case mostSignificantHour(Int)
  
  
  public init(dataByte: DataByte) {
    let timeFragment = dataByte.bottomNibble.value
    switch dataByte.topNibble.value {
    case 0b000: self = .leastSignificantFrame(timeFragment)
    case 0b001: self = .mostSignificantFrame(timeFragment)
    case 0b010: self = .leastSignificantSecond(timeFragment)
    case 0b011: self = .mostSignificantSecond(timeFragment)
    case 0b100: self = .leastSignificantMinute(timeFragment)
    case 0b101: self = .mostSignificantMinute(timeFragment)
    case 0b110: self = .leastSignificantHour(timeFragment)
    case 0b111: self = .mostSignificantHour(timeFragment)
    default: preconditionFailure("Top nibble not three bits.")
    }
  }
}


extension SMPTEFragment: ByteConvertible {
  public var byte: UInt8 {
    switch self {
    case let .leastSignificantFrame(nibble):
      return UInt8(clamping: 0b000_0000 | nibble)
    case let .mostSignificantFrame(nibble):
      return UInt8(clamping: 0b001_0000 | nibble)
    case let .leastSignificantSecond(nibble):
      return UInt8(clamping: 0b010_0000 | nibble)
    case let .mostSignificantSecond(nibble):
      return UInt8(clamping: 0b011_0000 | nibble)
    case let .leastSignificantMinute(nibble):
      return UInt8(clamping: 0b100_0000 | nibble)
    case let .mostSignificantMinute(nibble):
      return UInt8(clamping: 0b101_0000 | nibble)
    case let .leastSignificantHour(nibble):
      return UInt8(clamping: 0b110_0000 | nibble)
    case let .mostSignificantHour(nibble):
      return UInt8(clamping: 0b111_0000 | nibble)
    }
  }
}
