import Foundation



public protocol Int14Data: MultibyteConvertible {
  var value: Int { get }
  init(clamp: Int)
}



public extension Int14Data {
  init(lsb: DataByte, msb: DataByte) {
    self.init(clamp: msb.asMSB(withLSB: lsb))
  }
  
  
  var lsb: Int7Value {
    AnyDataByte(clamp: value & 0b0111_1111)
  }
  
  
  var msb: Int7Value {
    AnyDataByte(clamp: (value & 0b0011_1111_1000_0000) >> 7)
  }
  
  
  var data: Data {
    return Data(byte1: lsb.byte, byte2: msb.byte)
  }
}
