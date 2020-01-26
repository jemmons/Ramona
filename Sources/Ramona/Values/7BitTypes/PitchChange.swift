import Foundation



public struct PitchChange: Int14Data {
  @Int14Clamp public var value: Int = 0
  
  
  public init(clamp value: Int) {
    self.value = value
  }
}



public extension PitchChange {
  static var off: Self { Self(lsb: AnyDataByte(clamp: 0), msb: AnyDataByte(clamp: 64)) }
  static var max: Self { Self(lsb: AnyDataByte(clamp: 127), msb: AnyDataByte(clamp: 127)) }
  static var min: Self { Self(lsb: AnyDataByte(clamp: 0), msb: AnyDataByte(clamp: 0)) }
}

