import Foundation



internal enum Status {
  case noteOff(Channel)
  case noteOn(Channel)
  case polyKeyPressure(Channel)
  case controlChange(Channel)
  case programChange(Channel)
  case channelPressure(Channel)
  case pitchBend(Channel)
  case systemExclusive
  case timeCodeQuarterFrame
  case songPositionPointer
  case songSelect
  case tuneRequest
  case endOfExclusive
  case timingClock
  case start
  case `continue`
  case stop
  case activeSensing
  case systemReset
  
  
  
  internal enum Throwable: LocalizedError {
    case noStatusFlag
    case unknown
    
    var errorDescription: String? {
      switch self {
      case .noStatusFlag:
        return "The given byte does not have its status flag set."
      case .unknown:
        return "Unknown or undefined status code encountered."
      }
    }
  }
  
  
  init(byte: UInt8) throws {
    guard byte.isStatus else {
      throw Throwable.noStatusFlag
    }
    
    switch byte.statusCode {
    case 0b000:
      self = .noteOff(byte.channel)
    case 0b001:
      self = .noteOn(byte.channel)
    case 0b010:
      self = .polyKeyPressure(byte.channel)
    case 0b011:
      self = .controlChange(byte.channel)
    case 0b100:
      self = .programChange(byte.channel)
    case 0b101:
      self = .channelPressure(byte.channel)
    case 0b110:
      self = .pitchBend(byte.channel)
    case 0b111:
      switch byte.systemCode {
      case 0b0000:
        self = .systemExclusive
      case 0b0001:
        self = .timeCodeQuarterFrame
      case 0b0010:
        self = .songPositionPointer
      case 0b0011:
        self = .songSelect
      case 0b0100,
           0b0101:
        throw Throwable.unknown
      case 0b0110:
        self = .tuneRequest
      case 0b0111:
        self = .endOfExclusive
      case 0b1000:
        self = .timingClock
      case 0b1001:
        throw Throwable.unknown
      case 0b1010:
        self = .start
      case 0b1011:
        self = .continue
      case 0b1100:
        self = .stop
      case 0b1101:
        throw Throwable.unknown
      case 0b1110:
        self = .activeSensing
      case 0b1111:
        self = .systemReset
      default:
        fatalError("Integers are broken.")
      }
    default:
      fatalError("Integers are broken.")
    }
  }
}



// MARK: - INTERNAL
internal extension Status {
  var numberOfDataBytes: Int {
    switch self {
    case .noteOff,
         .noteOn,
         .polyKeyPressure,
         .controlChange,
         .pitchBend,
         .songPositionPointer:
      return 2
    case .programChange,
         .channelPressure,
         .timeCodeQuarterFrame,
         .songSelect:
      return 1
    case .systemExclusive:
      return 0
    case .tuneRequest,
         .endOfExclusive,
         .timingClock,
         .start,
         .continue,
         .stop,
         .activeSensing,
         .systemReset:
      return 0
    }
  }
}




// MARK: - HELPERS

private extension UInt8 {
  var isStatus: Bool {
    return self & 0b10000000 == 0b10000000
  }

  var statusCode: UInt8 {
    return (self & 0b01110000) >> 4
  }
  
  var systemCode: UInt8 {
    return (self & 0b00001111)
  }
  
  var channel: Channel {
    guard let someChannel = Channel(rawValue: Int(self & 0b00001111)) else {
      fatalError("Channels must exist between 0–15.")
    }
    return someChannel
  }
}


