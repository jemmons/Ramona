import Foundation



public struct Beats: Int14Value {
  @PositiveMax(0b0011_1111_1111_1111) public var value: Int = 0

  
  public init(clamp value: Int) {
    self.value = value
  }
}
