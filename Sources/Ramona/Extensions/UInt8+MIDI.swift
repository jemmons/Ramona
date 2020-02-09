import Foundation



internal extension UInt8 {
  var isStatus: Bool {
    return self & 0b1000_0000 == 0b1000_0000
  }  
}
