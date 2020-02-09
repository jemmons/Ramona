import Foundation



public struct MessageData {
  public var first: DataByte?
  public var second: DataByte?
  
  
  init(first: DataByte? = nil, second: DataByte? = nil) {
    self.first = first
    self.second = second
  }
  
  
  mutating func append(_ byte: DataByte) throws {
    switch (first, second) {
    case (nil, _ ):
      first = byte
    case (_, nil):
      second = byte
    default:
      throw Error.tooMuchData
    }
  }
}



public extension MessageData {
  enum Error: LocalizedError {
    case missingData
    case tooMuchData
    
    public var errorDescription: String? {
      switch self {
      case .missingData:
        return "There is insufficiant data for this message."
      case .tooMuchData:
        return "Messages should not include more than two bytes of data."
      }
    }
  }
  
  
  func firstByte() throws -> DataByte {
    guard let byte = first else {
      throw Error.missingData
    }
    return byte
  }
  
  
  func secondByte() throws -> DataByte {
    guard let byte = second else {
      throw Error.missingData
    }
    return byte
  }
}
