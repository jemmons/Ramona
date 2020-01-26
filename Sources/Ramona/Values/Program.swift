import Foundation



public struct Program: DataByte {
  @Int7Clamp public var value: Int = 0
  
  
  public init(clamp value: Int) {
    self.value = value
  }
}



// GM1
public extension Program {
  static var acousticGrandPiano: Self { Self(clamp: 0) }
  static var brightAcousticPiano: Self { Self(clamp: 1) }
  static var electricGrandPiano: Self { Self(clamp: 2) }
  static var honkyTonkPiano: Self { Self(clamp: 3) }
  static var electricPiano1: Self { Self(clamp: 4) }
  static var electricPiano2: Self { Self(clamp: 5) }
  static var harpsichord: Self { Self(clamp: 6) }
  static var clavinet: Self { Self(clamp: 7) }
}



// GM1 Percussion
public extension Program {
  static var acousticBassDrum: Self { Self(clamp: 35) }
  static var bassDrum1: Self { Self(clamp: 36) }
  static var sideStickRimshot: Self { Self(clamp: 37) }
  static var acousticSnare: Self { Self(clamp: 38) }
  static var handClap: Self { Self(clamp: 39) }
  static var electricSnare: Self { Self(clamp: 40) }
  static var lowFloorTom: Self { Self(clamp: 41) }
  static var closedHiHat: Self { Self(clamp: 42) }
  static var highFloorTom: Self { Self(clamp: 43) }
  static var pedalHiHat: Self { Self(clamp: 44) }
  static var lowTom: Self { Self(clamp: 45) }
  static var openHiHat: Self { Self(clamp: 46) }
  static var lowMidTom: Self { Self(clamp: 47) }
  static var hiMidTom: Self { Self(clamp: 48) }
  static var crashCymbal1: Self { Self(clamp: 49) }
  static var highTom: Self { Self(clamp: 50) }
}
