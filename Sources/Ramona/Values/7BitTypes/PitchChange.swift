import Foundation



public struct PitchChange: Int14Value {
  @PositiveMax(0b0011_1111_1111_1111) public var value: Int = 0
  
  
  public init(clamp value: Int) {
    self.value = value
  }
}



public extension PitchChange {
  static var off: Self { Self(lsb: DataByte(clamp: 0), msb: DataByte(clamp: 64)) }
  static var max: Self { Self(lsb: DataByte(clamp: 127), msb: DataByte(clamp: 127)) }
  static var min: Self { Self(lsb: DataByte(clamp: 0), msb: DataByte(clamp: 0)) }
}

