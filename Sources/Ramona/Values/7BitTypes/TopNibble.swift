import Foundation


internal struct TopNibble: Equatable {
  @PositiveMax(0b111) var value: Int = 0

  
  // Message Types
  static let noteOff = Self(clamp: 0b000)
  static let noteOn = Self(clamp: 0b001)
  static let polyKeyPressure = Self(clamp: 0b010)
  static let controlChange = Self(clamp: 0b011)
  static let programChange = Self(clamp: 0b100)
  static let channelPressure = Self(clamp: 0b101)
  static let pitchBend = Self(clamp: 0b110)
  static let systemMessage = Self(clamp: 0b111)

  
  init(clamp value: Int) {
    self.value = value
  }

  
  init(clamp value: UInt8) {
    self.init(clamp: Int(value))
  }
  
  
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.value == rhs.value
  }
}
