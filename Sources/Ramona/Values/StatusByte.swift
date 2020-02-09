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
  
  
  internal init(top: TopNibble, bottom: BottomNibble) {
    value = top.value << 4 | bottom.value
  }
}


extension StatusByte: ByteConvertible {
  public var byte: UInt8 {
    UInt8(clamping: 0b1000_0000 | value)
  }
}



public extension StatusByte {
  var channel: Channel {
    Channel(nibble: bottomNibble)
  }
  
  
  var expectedDataByteCount: Int {
    switch (topNibble, bottomNibble) {
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
