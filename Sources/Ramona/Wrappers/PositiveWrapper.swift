import Foundation



@propertyWrapper
public struct Positive<Value> where Value: Numeric, Value: Comparable{
  private var value: Value
  
  
  public init(wrappedValue: Value) {
    value = wrappedValue
  }
  
  
  public var wrappedValue: Value {
    get {
      return max(value, .zero)
    }
    
    set {
      value = newValue
    }
  }
}
