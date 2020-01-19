import Foundation



public struct Beats: Int14Value {
  private let lsb: Int7Value
  private let msb: Int7Value
  public var value: Int { msb.asMSB(withLSB: lsb) }

  
  public init(lsb: Int7Value, msb: Int7Value) {
    self.lsb = lsb
    self.msb = msb
  }
}
