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
  var byte: UInt8 {
    return UInt8(clamping: 0b1000_0000 | value)
  }
  
  
  var expectedDataByteCount: Int {
    switch (topNibble, bottomNibble) {
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
