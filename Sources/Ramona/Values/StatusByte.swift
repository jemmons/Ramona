import Foundation



public struct StatusByte: Int7Value {
  @Int7Clamp public var value: Int = 0
  

  public init(clamp value: Int) {
    self.value = value
  }
  
  
  public init(byte: UInt8) throws {
    guard byte.isStatus else {
      throw StatusBitError.isNotSet
    }
    self.init(clamp: Int(byte & 0b0111_1111))
  }
}



public extension StatusByte {
  enum MessageType: UInt8 {
    case noteOff = 0b000
    case noteOn = 0b001
    case polyKeyPressure = 0b010
    case controlChange = 0b011
    case programChange = 0b100
    case channelPressure = 0b101
    case pitchBend = 0b110
    case systemMessage = 0b111
  }
  
  
  enum SystemType: UInt8 {
    case systemExclusiveStart = 0b0000
    case timeCodeQuarterFrame = 0b0001
    case songPositionPointer = 0b0010
    case songSelect = 0b0011
    case tuneRequest = 0b0110
    case systemExclusiveEnd = 0b0111
    case timingClock = 0b1000
    case start = 0b1010
    case `continue` = 0b1011
    case stop = 0b1100
    case activeSensing = 0b1110
    case systemReset = 0b1111
  }
  
  
  var byte: UInt8 {
    return UInt8(clamping: 0b1000_0000 | value)
  }
  
  
  var messageType: MessageType {
    guard let type = MessageType(rawValue: topNibble) else {
      fatalError("Message type was greater than three bits")
    }
    return type
  }
  
  
  var systemType: SystemType? {
    return SystemType(rawValue: bottomNibble)
  }
  
  
  var expectedDataByteCount: Int {
    switch (messageType, systemType) {
    case (.noteOff, _),
         (.noteOn, _),
         (.polyKeyPressure, _),
         (.controlChange, _),
         (.pitchBend, _),
         (.systemMessage, .songPositionPointer):
      return 2
    case (.programChange, _),
         (.channelPressure, _),
         (.systemMessage, .timeCodeQuarterFrame),
         (.systemMessage, .songSelect):
      return 1
    default:
      return 0
    }
  }
}
