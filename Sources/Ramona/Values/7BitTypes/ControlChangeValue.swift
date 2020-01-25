import Foundation



public struct ControlChangeValue: Int7Value {
  @PositiveMax(0b0111_1111) public var value: Int = 0

  
  public init(clamp value: Int) {
    self.value = value
  }
}



public extension ControlChangeValue {
  static var off: Self { Self(clamp: 0) }
  static var on: Self { Self(clamp: 127) }
  
  
  func toggle() -> Self {
    switch value {
    case 64...:
      return Self.off
    default:
      return Self.on
    }
  }
}
