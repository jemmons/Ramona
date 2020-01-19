import Foundation



public struct PitchChange: Int14Value {
  private let lsb: Int7Value
  private let msb: Int7Value
  public var value: Int { msb.asMSB(withLSB: lsb) }
  
  
  public init(lsb: Int7Value, msb: Int7Value) {
    self.lsb = lsb
    self.msb = msb
  }
}



public extension PitchChange {
  static var off: Self { Self(lsb: DataByte(clamp: 0), msb: DataByte(clamp: 64)) }
  static var max: Self { Self(lsb: DataByte(clamp: 127), msb: DataByte(clamp: 127)) }
  static var min: Self { Self(lsb: DataByte(clamp: 0), msb: DataByte(clamp: 0)) }
}

