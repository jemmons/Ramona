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
    let nibble = Int(dataByte.bottomNibble)
    switch dataByte.topNibble {
    case 0b000: self = .leastSignificantFrame(nibble)
    case 0b001: self = .mostSignificantFrame(nibble)
    case 0b010: self = .leastSignificantSecond(nibble)
    case 0b011: self = .mostSignificantSecond(nibble)
    case 0b100: self = .leastSignificantMinute(nibble)
    case 0b101: self = .mostSignificantMinute(nibble)
    case 0b110: self = .leastSignificantHour(nibble)
    case 0b111: self = .mostSignificantHour(nibble)
    default: fatalError("Integers are broken.")
    }
  }
}


public extension SMPTEFragment {
  var byte: UInt8 {
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
