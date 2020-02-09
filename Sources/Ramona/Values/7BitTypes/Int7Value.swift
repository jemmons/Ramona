import Foundation



public protocol Int7Value: CustomStringConvertible, ByteConvertible {
  var value: Int { get }
  init(clamp: Int)
}



public extension Int7Value {
  init(_ int7Value: Int7Value) {
    self.init(clamp: int7Value.value)
  }
  
  
  var byte: UInt8 {
    return UInt8(clamping: value)
  }
  
  
  var description: String {
    String(value)
  }


  func asMSB(withLSB lsb: Int7Value) -> Int {
    return (value << 7) | lsb.value
  }
}



internal extension Int7Value {
  var topNibble: TopNibble {
    TopNibble(clamp: (byte & 0b0111_0000) >> 4)
  }
  
  
  var bottomNibble: BottomNibble {
    BottomNibble(clamp: byte & 0b0000_1111)
  }
}
