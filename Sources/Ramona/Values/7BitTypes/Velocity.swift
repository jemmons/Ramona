import Foundation



public struct Velocity: Int7Value {
  private let byte: DataByte
  public var value: Int { byte.value }
  
  
  public init(dataByte: DataByte) {
    byte = dataByte
  }
  
  public init(clamp: Int) {
    byte = DataByte(clamp: clamp)
  }
}



public extension Velocity {
  static var off: Self { Self(clamp: 0) }
  
  
  static var ppp: Self { Self(clamp: 1) }

  
  static var pp: Self { Self(clamp: 16*2) }
  
  
  static var p: Self { Self(clamp: 16*3) }
  
  
  static var mp: Self { Self(clamp: 16*4) }
  
  
  static var mf: Self { Self(clamp: 16*5) }
  
  
  static var f: Self { Self(clamp: 16*6) }
  
  
  static var ff: Self { Self(clamp: 16*7) }
  
  
  static var fff: Self { Self(clamp: 127) }
}
