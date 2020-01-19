import Foundation



public struct ControlChangeValue: Int7Value {
  private let byte: Int7Value
  public var value: Int { byte.value }
  
  
  init(_ int7: Int7Value) {
    byte = int7
  }

  
  init(clamp: Int) {
    byte = DataByte(clamp: clamp)
  }
}


