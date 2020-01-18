import Foundation



public struct PitchChange {
  private let lsb: DataByte
  private let msb: DataByte
  var value: Int { msb.asMSB(withLSB: lsb) }
  
  
  init(lsb: DataByte, msb: DataByte) {
    self.lsb = lsb
    self.msb = msb
  }
}



public extension PitchChange {
  static var off: Self { Self(lsb: DataByte(clamp: 0), msb: DataByte(clamp: 64)) }
  static var max: Self { Self(lsb: DataByte(clamp: 127), msb: DataByte(clamp: 127)) }
  static var min: Self { Self(lsb: DataByte(clamp: 0), msb: DataByte(clamp: 0)) }
}

