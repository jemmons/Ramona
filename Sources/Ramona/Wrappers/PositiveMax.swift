import Foundation



@propertyWrapper
public struct PositiveMax<Value> where Value: Numeric & Comparable {
  private var value: Clamp<Value>
  
  
  init(wrappedValue: Value, upperBound: Value) {
    value = Clamp(wrappedValue: wrappedValue, to: Value.zero...upperBound)
  }
  
  
  public var wrappedValue: Value {
    get { value.wrappedValue }
    set { value.wrappedValue = newValue }
  }
}
