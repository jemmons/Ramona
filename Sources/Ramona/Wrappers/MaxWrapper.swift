import Foundation



@propertyWrapper
public struct Max<Value> where Value: Numeric, Value: Comparable {
  private var value: Value
  private let max: Value
  
  
  public init(wrappedValue: Value, including max: Value) {
    self.max = max
    value = wrappedValue
  }
  
  
  public init(wrappedValue: Value, bits: Int) {
    guard let someMax = Value(exactly: (1 << bits) - 1) else {
      fatalError("Type \(type(of: Value.self)) in unable to represent \(bits) bits.")
    }
    max = someMax
    value = wrappedValue
  }
  
  
  public var wrappedValue: Value {
    get {
      return min(value, max)
    }
    
    set {
      value = newValue
    }
  }
}
