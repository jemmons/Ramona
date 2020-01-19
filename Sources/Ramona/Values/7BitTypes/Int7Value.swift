import Foundation



public protocol Int7Value {
  var value: Int { get }
}


public extension Int7Value {
  func asMSB(withLSB lsb: Int7Value) -> Int {
    return (value << 7) | lsb.value
  }
}
