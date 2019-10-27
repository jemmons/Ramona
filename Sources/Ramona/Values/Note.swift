import Foundation

@propertyWrapper
public struct MIDIValue {
  var value: Int
  
  
  public init(wrappedValue: Int) {
    value = wrappedValue
  }
  
  
  public var wrappedValue: Int {
    get {
      return min(127, max(0, value))
    }
    set {
      value = newValue
    }
  }
}



public struct Note {
  @MIDIValue public private(set) var number: Int
  @MIDIValue public private(set) var value: Int
 
  
  public init(number: Int, value: Int) {
    self.number = number
    self.value = value
  }
}



extension Note: CustomStringConvertible {
  public var description: String {
    switch number {
    case (0...11):
      return "MIDI Note \(number)"
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
    default:
      return "Unkown Value"
    }
  }
}
