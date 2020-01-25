import Foundation



public struct StatusByte {
  private let value: UInt8
  public var messageType: Int { Int(value.messageType) }
  public var channelIndex: Int { Int(value.channelIndex) }
  public var systemMessageType: Int { channelIndex }
  
  public init(byte: UInt8) throws {
    guard byte.isStatus else {
      throw Error.noStatusFlag
    }
    value = byte
  }
}



public extension StatusByte {
  enum Error: LocalizedError {
    case noStatusFlag
    
    public var errorDescription: String? {
      switch self {
      case .noStatusFlag:
        return "The given byte does not have its status flag set."
      }
    }
  }
  
  
  var byte: UInt8 {
    return UInt8(clamping: 0b1000_0000 | (messageType << 4) | channelIndex)
  }
  
  
  var expectedDataByteCount: Int {
    switch (messageType, systemMessageType) {
    case (0b000, _), // note off
         (0b001, _), // note on
         (0b010, _), // poly key pressure
         (0b011, _), // control change
         (0b110, _), // pitch bend
         (0b111, 0b0010): // position pointer
      return 2
    case (0b100, _), // program change
         (0b101, _), // channel pressure
         (0b111, 0b0001), // time code
         (0b111, 0b0011): // song select
      return 1
    default:
      return 0
    }
    
  }
}



// MARK: - HELPERS
private extension UInt8 {
  var isStatus: Bool {
    return self & 0b10000000 == 0b10000000
  }
  
  var messageType: UInt8 {
    return (self & 0b01110000) >> 4
  }
  
  var channelIndex: UInt8 {
    return (self & 0b00001111)
  }  
}


