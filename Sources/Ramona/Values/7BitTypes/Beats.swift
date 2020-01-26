import Foundation



public struct Beats: Int14Data {
  @Int14Clamp public var value: Int = 0

  
  public init(clamp value: Int) {
    self.value = value
  }
}
