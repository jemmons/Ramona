import Foundation



internal extension UInt8 {
  var isStatus: Bool {
    return self & 0b10000000 == 0b10000000
  }
}
