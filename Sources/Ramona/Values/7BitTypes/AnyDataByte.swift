import Foundation



public struct AnyDataByte: DataByte {
  @Int7Clamp public var value: Int = 0
  
  
  public init(clamp value: Int) {
    self.value = value
  }
}
