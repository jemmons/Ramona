import Foundation



public struct DataByte: Int7Value {
  public let value: Int
  
  
  public init(clamp value: Int) {
    self.value = max(0, min(0b0111_1111, value))
  }
  
  public init(byte: UInt8) throws {
    guard byte.isData else {
      throw Error.isStatusByte
    }
    value = Int(byte)
  }
}



public extension DataByte {
  enum Error: LocalizedError {
    case isStatusByte

    public var errorDescription: String? {
      switch self {
      case .isStatusByte:
        return "The status flag for this byte is set."
      }
    }
  }
}
  

  
private extension UInt8 {
  var isData: Bool {
    return self & 0b10000000 == 0b00000000
  }
}
