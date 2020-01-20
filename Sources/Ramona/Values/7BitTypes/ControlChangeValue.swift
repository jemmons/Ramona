import Foundation



public struct ControlChangeValue: Int7Value {
  private let byte: Int7Value
  public var value: Int { byte.value }
  
  
  public init(_ int7: Int7Value) {
    byte = int7
  }

  
  public init(clamp: Int) {
    byte = DataByte(clamp: clamp)
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
