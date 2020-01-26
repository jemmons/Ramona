import Foundation



@propertyWrapper
public struct Int14Clamp<Value> where Value: Numeric & Comparable {
  @PositiveMax(0b0011_1111_1111_1111) private var value: Value = Value.zero
  
  
  public init(wrappedValue: Value) {
    value = wrappedValue
  }
  
  
  public var wrappedValue: Value {
    get { value }
    set { value = newValue }
  }
}

