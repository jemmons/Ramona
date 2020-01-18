import Foundation



public struct Beats {
  private let lsb: DataByte
  private let msb: DataByte
  public var count: Int { msb.asMSB(withLSB: lsb) }

  
  public init(lsb: DataByte, msb: DataByte) {
    self.lsb = lsb
    self.msb = msb
  }
}
