import Foundation



internal struct BottomNibble: Equatable {
  @PositiveMax(0b1111) var value: Int = 0

  
  static let systemExclusiveStart = Self(clamp: 0b0000)
  static let timeCodeQuarterFrame = Self(clamp: 0b0001)
  static let songPositionPointer = Self(clamp: 0b0010)
  static let songSelect = Self(clamp: 0b0011)
  static let tuneRequest = Self(clamp: 0b0110)
  static let systemExclusiveEnd = Self(clamp: 0b0111)
  static let timingClock = Self(clamp: 0b1000)
  static let start = Self(clamp: 0b1010)
  static let `continue` = Self(clamp: 0b1011)
  static let stop = Self(clamp: 0b1100)
  static let activeSensing = Self(clamp: 0b1110)
  static let systemReset = Self(clamp: 0b1111)

  
  init(clamp value: Int) {
    self.value = value
  }
  
  
  init(clamp value: UInt8) {
    self.init(clamp: Int(value))
  }
  
  
  static func ==(lhs: Self, rhs: Self) -> Bool {
    lhs.value == rhs.value
  }
}
