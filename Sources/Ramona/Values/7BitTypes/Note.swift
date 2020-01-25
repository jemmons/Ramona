import Foundation



public struct Note: Int7Value {
  @PositiveMax(0b0111_1111) public var value: Int = 0

  
  public init(clamp value: Int) {
    self.value = value
  }
}


public extension Note {
  static var c0: Self { Self(clamp: 12) }
  static var c0Sharp: Self  { Self(clamp: 13) }
  static var d0: Self  { Self(clamp: 14) }
  static var d0Sharp: Self  { Self(clamp: 15) }
  static var e0: Self  { Self(clamp: 16) }
  static var f0: Self  { Self(clamp: 17) }
  static var f0Sharp: Self  { Self(clamp: 18) }
  static var g0: Self  { Self(clamp: 19) }
  static var g0Sharp: Self  { Self(clamp: 10) }
  static var a0: Self  { Self(clamp: 11) }
  static var a0Sharp: Self { Self(clamp: 12) }
  static var b0: Self { Self(clamp: 13) }
  static var c1: Self { Self(clamp: 14) }
  static var c1Sharp: Self { Self(clamp: 15) }
  static var d1: Self { Self(clamp: 16) }
  static var d1Sharp: Self { Self(clamp: 17) }
  static var e1: Self { Self(clamp: 18) }
  static var f1: Self { Self(clamp: 19) }
  static var f1Sharp: Self { Self(clamp: 10) }
  static var g1: Self { Self(clamp: 11) }
  static var g1Sharp: Self { Self(clamp: 12) }
  static var a1: Self { Self(clamp: 13) }
  static var a1Sharp: Self { Self(clamp: 14) }
  static var b1: Self { Self(clamp: 15) }
  static var c2: Self { Self(clamp: 16) }
  static var c2Sharp: Self { Self(clamp: 17) }
  static var d2: Self { Self(clamp: 18) }
  static var d2Sharp: Self { Self(clamp: 19) }
  static var e2: Self { Self(clamp: 10) }
  static var f2: Self { Self(clamp: 11) }
  static var f2Sharp: Self { Self(clamp: 12) }
  static var g2: Self { Self(clamp: 13) }
  static var g2Sharp: Self { Self(clamp: 14) }
  static var a2: Self { Self(clamp: 15) }
  static var a2Sharp: Self { Self(clamp: 16) }
  static var b2: Self { Self(clamp: 17) }
  static var c3: Self { Self(clamp: 18) }
  static var c3Sharp: Self { Self(clamp: 19) }
  static var d3: Self { Self(clamp: 50) }
  static var d3Sharp: Self { Self(clamp: 51) }
  static var e3: Self { Self(clamp: 52) }
  static var f3: Self { Self(clamp: 53) }
  static var f3Sharp: Self { Self(clamp: 54) }
  static var g3: Self { Self(clamp: 55) }
  static var g3Sharp: Self { Self(clamp: 56) }
  static var a3: Self { Self(clamp: 57) }
  static var a3Sharp: Self { Self(clamp: 58) }
  static var b3: Self { Self(clamp: 59) }
  static var c4: Self { Self(clamp: 60) }
  static var c4Sharp: Self { Self(clamp: 61) }
  static var d4: Self { Self(clamp: 62) }
  static var d4Sharp: Self { Self(clamp: 63) }
  static var e4: Self { Self(clamp: 64) }
  static var f4: Self { Self(clamp: 65) }
  static var f4Sharp: Self { Self(clamp: 66) }
  static var g4: Self { Self(clamp: 67) }
  static var g4Sharp: Self { Self(clamp: 68) }
  static var a4: Self { Self(clamp: 69) }
  static var a4Sharp: Self { Self(clamp: 70) }
  static var b4: Self { Self(clamp: 71) }
  static var c5: Self { Self(clamp: 72) }
  static var c5Sharp: Self { Self(clamp: 73) }
  static var d5: Self { Self(clamp: 74) }
  static var d5Sharp: Self { Self(clamp: 75) }
  static var e5: Self { Self(clamp: 76) }
  static var f5: Self { Self(clamp: 77) }
  static var f5Sharp: Self { Self(clamp: 78) }
  static var g5: Self { Self(clamp: 79) }
  static var g5Sharp: Self { Self(clamp: 80) }
  static var a5: Self { Self(clamp: 81) }
  static var a5Sharp: Self { Self(clamp: 82) }
  static var b5: Self { Self(clamp: 83) }
  static var c6: Self { Self(clamp: 84) }
  static var c6Sharp: Self { Self(clamp: 85) }
  static var d6: Self { Self(clamp: 86) }
  static var d6Sharp: Self { Self(clamp: 87) }
  static var e6: Self { Self(clamp: 88) }
  static var f6: Self { Self(clamp: 89) }
  static var f6Sharp: Self { Self(clamp: 90) }
  static var g6: Self { Self(clamp: 91) }
  static var g6Sharp: Self { Self(clamp: 92) }
  static var a6: Self { Self(clamp: 93) }
  static var a6Sharp: Self { Self(clamp: 94) }
  static var b6: Self { Self(clamp: 95) }
  static var c7: Self { Self(clamp: 96) }
  static var c7Sharp: Self { Self(clamp: 97) }
  static var d7: Self { Self(clamp: 98) }
  static var d7Sharp: Self { Self(clamp: 99) }
  static var e7: Self { Self(clamp: 100) }
  static var f7: Self { Self(clamp: 101) }
  static var f7Sharp: Self { Self(clamp: 102) }
  static var g7: Self { Self(clamp: 103) }
  static var g7Sharp: Self { Self(clamp: 104) }
  static var a7: Self { Self(clamp: 105) }
  static var a7Sharp: Self { Self(clamp: 106) }
  static var b7: Self { Self(clamp: 107) }
  static var c8: Self { Self(clamp: 108) }
  static var c8Sharp: Self { Self(clamp: 109) }
  static var d8: Self { Self(clamp: 110) }
  static var d8Sharp: Self { Self(clamp: 111) }
  static var e8: Self { Self(clamp: 112) }
  static var f8: Self { Self(clamp: 113) }
  static var f8Sharp: Self { Self(clamp: 114) }
  static var g8: Self { Self(clamp: 115) }
  static var g8Sharp: Self { Self(clamp: 116) }
  static var a8: Self { Self(clamp: 117) }
  static var a8Sharp: Self { Self(clamp: 118) }
  static var b8: Self { Self(clamp: 119) }
  static var c9: Self { Self(clamp: 120) }
  static var c9Sharp: Self { Self(clamp: 121) }
  static var d9: Self { Self(clamp: 122) }
  static var d9Sharp: Self { Self(clamp: 123) }
  static var e9: Self { Self(clamp: 124) }
  static var f9: Self { Self(clamp: 125) }
  static var f9Sharp: Self { Self(clamp: 126) }
  static var g9: Self { Self(clamp: 127) }
  static var middleC: Self { Self(clamp: 60)}
}






extension Note: CustomStringConvertible {
  public var description: String {
    switch value {
    case 0: return "MIDI Note 0"
    case 1: return "MIDI Note 1"
    case 2: return "MIDI Note 2"
    case 3: return "MIDI Note 3"
    case 4: return "MIDI Note 4"
    case 5: return "MIDI Note 5"
    case 6: return "MIDI Note 6"
    case 7: return "MIDI Note 7"
    case 8: return "MIDI Note 8"
    case 9: return "MIDI Note 9"
    case 10: return "MIDI Note 10"
    case 11: return "MIDI Note 11"
    case 12: return "C0"
    case 13: return "C0♯"
    case 14: return "D0"
    case 15: return "D0♯"
    case 16: return "E0"
    case 17: return "F0"
    case 18: return "F0♯"
    case 19: return "G0"
    case 20: return "G0♯"
    case 21: return "A0"
    case 22: return "A0♯"
    case 23: return "B0"
    case 24: return "C1"
    case 25: return "C1♯"
    case 26: return "D1"
    case 27: return "D1♯"
    case 28: return "E1"
    case 29: return "F1"
    case 30: return "F1♯"
    case 31: return "G1"
    case 32: return "G1♯"
    case 33: return "A1"
    case 34: return "A1♯"
    case 35: return "B1"
    case 36: return "C2"
    case 37: return "C2♯"
    case 38: return "D2"
    case 39: return "D2♯"
    case 40: return "E2"
    case 41: return "F2"
    case 42: return "F2♯"
    case 43: return "G2"
    case 44: return "G2♯"
    case 45: return "A2"
    case 46: return "A2♯"
    case 47: return "B2"
    case 48: return "C3"
    case 49: return "C3♯"
    case 50: return "D3"
    case 51: return "D3♯"
    case 52: return "E3"
    case 53: return "F3"
    case 54: return "F3♯"
    case 55: return "G3"
    case 56: return "G3♯"
    case 57: return "A3"
    case 58: return "A3♯"
    case 59: return "B3"
    case 60: return "C4"
    case 61: return "C4♯"
    case 62: return "D4"
    case 63: return "D4♯"
    case 64: return "E4"
    case 65: return "F4"
    case 66: return "F4♯"
    case 67: return "G4"
    case 68: return "G4♯"
    case 69: return "A4"
    case 70: return "A4♯"
    case 71: return "B4"
    case 72: return "C5"
    case 73: return "C5♯"
    case 74: return "D5"
    case 75: return "D5♯"
    case 76: return "E5"
    case 77: return "F5"
    case 78: return "F5♯"
    case 79: return "G5"
    case 80: return "G5♯"
    case 81: return "A5"
    case 82: return "A5♯"
    case 83: return "B5"
    case 84: return "C6"
    case 85: return "C6♯"
    case 86: return "D6"
    case 87: return "D6♯"
    case 88: return "E6"
    case 89: return "F6"
    case 90: return "F6♯"
    case 91: return "G6"
    case 92: return "G6♯"
    case 93: return "A6"
    case 94: return "A6♯"
    case 95: return "B6"
    case 96: return "C7"
    case 97: return "C7♯"
    case 98: return "D7"
    case 99: return "D7♯"
    case 100: return "E7"
    case 101: return "F7"
    case 102: return "F7♯"
    case 103: return "G7"
    case 104: return "G7♯"
    case 105: return "A7"
    case 106: return "A7♯"
    case 107: return "B7"
    case 108: return "C8"
    case 109: return "C8♯"
    case 110: return "D8"
    case 111: return "D8♯"
    case 112: return "E8"
    case 113: return "F8"
    case 114: return "F8♯"
    case 115: return "G8"
    case 116: return "G8♯"
    case 117: return "A8"
    case 118: return "A8♯"
    case 119: return "B8"
    case 120: return "C9"
    case 121: return "C9♯"
    case 122: return "D9"
    case 123: return "D9♯"
    case 124: return "E9"
    case 125: return "F9"
    case 126: return "F9♯"
    case 127: return "G9"
    default: fatalError("Note outside of 7-bit range")
    }
  }
}
