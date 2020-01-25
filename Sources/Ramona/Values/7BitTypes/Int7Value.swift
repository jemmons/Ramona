import Foundation



public protocol Int7Value: CustomStringConvertible {
  var value: Int { get }
  init(clamp: Int)
}



public enum DataError: LocalizedError {
  case isStatusByte
  
  public var errorDescription: String? {
    switch self {
    case .isStatusByte:
      return "The status flag for this byte is set."
    }
  }
}


public extension Int7Value {
  init(byte: UInt8) throws {
    guard byte.isData else {
      throw DataError.isStatusByte
    }
    self.init(clamp: Int(byte))
  }
  
  
  init(_ int7Value: Int7Value) {
    self.init(clamp: int7Value.value)
  }
  
  
  var byte: UInt8 {
    return UInt8(clamping: value)
  }
  
  
  func asMSB(withLSB lsb: Int7Value) -> Int {
    return (value << 7) | lsb.value
  }
}



public extension Int7Value {
  var description: String {
    String(value)
  }
}



private extension UInt8 {
  var isData: Bool {
    return self & 0b10000000 == 0b00000000
  }
}
