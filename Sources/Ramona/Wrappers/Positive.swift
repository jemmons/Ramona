import Foundation



@propertyWrapper
public struct Positive<Value> where Value: Numeric & Comparable {
  private var value: Clamp<Value>
  

  public init(wrappedValue: Value) {
    value = Clamp(wrappedValue: wrappedValue, to: Value.zero...)
  }
  

  public var wrappedValue: Value {
    get { value.wrappedValue }
    set { value.wrappedValue = newValue }
  }
}
