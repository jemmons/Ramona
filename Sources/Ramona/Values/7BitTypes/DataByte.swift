import Foundation



public protocol DataByte: Int7Value {
  init(byte: UInt8) throws
}



public enum StatusBitError: LocalizedError {
  case isSet, isNotSet
  
  public var errorDescription: String? {
    switch self {
    case .isSet:
      return "The status flag for this byte is set."
    case .isNotSet:
      return "The status flag for this byte is not set."
    }
  }
}



public extension DataByte {
  init(byte: UInt8) throws {
    guard !byte.isStatus else {
      throw StatusBitError.isSet
    }
    self.init(clamp: Int(byte))
  }
}
