import Foundation


public protocol Int14Data {
  var value: Int { get }
  init(clamp: Int)
}


public extension Int14Data {
  init(lsb: DataByte, msb: DataByte) {
    self.init(clamp: msb.asMSB(withLSB: lsb))
  }
}
