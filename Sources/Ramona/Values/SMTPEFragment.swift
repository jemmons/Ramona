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
    let nibble = dataByte.value & 0b0000_1111
    let type = dataByte.value & 0b0111_0000
    switch type {
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

