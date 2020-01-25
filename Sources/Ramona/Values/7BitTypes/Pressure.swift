import Foundation



public struct Pressure: Int7Value {
  @PositiveMax(0b0111_1111) public var value: Int = 0


  public init(clamp value: Int) {
    self.value = value
  }
}
