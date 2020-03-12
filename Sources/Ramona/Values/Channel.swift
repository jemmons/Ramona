import Foundation


public enum Channel: Int {
  public enum Error: LocalizedError {
    case outOfRange, missingData
    
    public var errorDescription: String? {
      switch self {
      case .outOfRange: return "Given channel outside range of 0–15."
      case .missingData: return "Unable to create channel due to missing data."
      }
    }
  }
  
  
  case ch1 = 0,
  ch2,
  ch3,
  ch4,
  ch5,
  ch6,
  ch7,
  ch8,
  ch9,
  ch10,
  ch11,
  ch12,
  ch13,
  ch14,
  ch15,
  ch16
  
  
  init(nibble: BottomNibble) {
    guard let c = Channel(rawValue: nibble.value) else {
      preconditionFailure("BottomNibble larger than 4 bits")
    }
    self = c
  }
  
  
  public init(byte: UInt8) throws {
    guard let c = Channel(rawValue: Int(byte)) else {
      throw Error.outOfRange
    }
    self = c
  }
  
  
  public init(data: Data) throws {
    guard let byte = data.first else {
      throw Error.missingData
    }
    try self.init(byte: byte)
  }
}



extension Channel: ByteConvertible {
  public var byte: UInt8 {
    return UInt8(clamping: rawValue)
  }
}



internal extension Channel {
  var nibble: BottomNibble {
    BottomNibble(clamp: rawValue)
  }
}



extension Channel: CustomStringConvertible {
  public var description: String {
    switch self {
    case .ch1: return "Channel 1"
    case .ch2: return "Channel 2"
    case .ch3: return "Channel 3"
    case .ch4: return "Channel 4"
    case .ch5: return "Channel 5"
    case .ch6: return "Channel 6"
    case .ch7: return "Channel 7"
    case .ch8: return "Channel 8"
    case .ch9: return "Channel 9"
    case .ch10: return "Channel 10"
    case .ch11: return "Channel 11"
    case .ch12: return "Channel 12"
    case .ch13: return "Channel 13"
    case .ch14: return "Channel 14"
    case .ch15: return "Channel 15"
    case .ch16: return "Channel 16"
    }
  }
}
