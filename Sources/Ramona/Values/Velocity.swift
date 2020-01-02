import Foundation



public struct Velocity {
  public let value: Int
  
  
  public init(_ value: Int) {
    self.value = min(127, max(0, value))
  }
}



public extension Velocity {
  static var off: Self {
    return Self(0)
  }
  
  
  static var ppp: Self {
    return Self(1)
  }

  
  static var pp: Self {
    return Self(16*2)
  }
  
  
  static var p: Self {
    return Self(16*3)
  }
  
  
  static var mp: Self {
    return Self(16*4)
  }
  
  
  static var mf: Self {
    return Self(16*5)
  }
  
  
  static var f: Self {
    return Self(16*6)
  }
  
  
  static var ff: Self {
    return Self(16*7)
  }
  
  
  static var fff: Self {
    return Self(127)
  }
}
