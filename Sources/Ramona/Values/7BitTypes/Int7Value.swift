import Foundation



public protocol Int7Value: CustomStringConvertible {
  var value: Int { get }
}



public extension Int7Value {
  func asMSB(withLSB lsb: Int7Value) -> Int {
    return (value << 7) | lsb.value
  }
}



public extension Int7Value {
  var description: String {
    String(value)
  }
}
