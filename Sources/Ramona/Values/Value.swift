import Foundation



public struct Value {
  private let _value: Int
  
  
  public init(_ value: Int) {
    _value = value
  }
  
  
  public var value: Int {
    return max(0, min(127, value))
  }
}
