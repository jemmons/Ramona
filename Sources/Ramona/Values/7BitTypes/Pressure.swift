import Foundation



public struct Pressure: Int7Value {
  private let byte: DataByte
  public var value: Int { byte.value }
  
  public init(dataByte: DataByte) {
    byte = dataByte
  }
  
  
  public init(clamp: Int) {
    byte = DataByte(clamp: clamp)
  }
}
