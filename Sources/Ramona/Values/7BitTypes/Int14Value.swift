import Foundation


public protocol Int14Value {
  var value: Int { get }
  init(clamp: Int)
}


public extension Int14Value {
  init(lsb: Int7Value, msb: Int7Value) {
    self.init(clamp: msb.asMSB(withLSB: lsb))
  }
}
