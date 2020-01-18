import Foundation



@propertyWrapper
public struct Clamp<Value> where Value: Numeric & Comparable {
  enum Bound {
    case upper(Value), lower(Value), range(lower: Value, upper: Value)
  }
  private let bound: Bound
  private var value: Value
  
  
  public init(wrappedValue: Value, to range: ClosedRange<Value>) {
    value = wrappedValue
    bound = .range(lower: range.lowerBound, upper: range.upperBound)
  }
  
  
  public init(wrappedValue: Value, to partialRange: PartialRangeFrom<Value>) {
    value = wrappedValue
    bound = .lower(partialRange.lowerBound)
  }
  
  
  public init(wrappedValue: Value, to partialRange: PartialRangeThrough<Value>) {
    value = wrappedValue
    bound = .upper(partialRange.upperBound)
  }
  
  
  public var wrappedValue: Value {
    get {
      switch bound {
      case let .lower(b):
        return max(value, b)
      case let .upper(b):
        return min(value, b)
      case let .range(lower: l, upper: u):
        return min(u, max(l, value))
      }
    }
    set { value = newValue }
  }
}
