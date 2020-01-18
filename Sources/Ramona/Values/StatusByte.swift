import Foundation



public struct StatusByte {
  private let value: UInt8
  public var messageType: Int { Int(value.messageType) }
  public var channelIndex: Int { Int(value.channelIndex) }
  public var systemMessageType: Int { channelIndex }

  public init(byte: UInt8) throws {
    guard byte.isStatus else {
      throw Error.noStatusFlag
    }
    value = byte
  }
}



public extension StatusByte {
  enum Error: LocalizedError {
    case noStatusFlag
    
    public var errorDescription: String? {
      switch self {
      case .noStatusFlag:
        return "The given byte does not have its status flag set."
      }
    }
  }
}



//// MARK: - INTERNAL
//internal extension Status {
//  var numberOfDataBytes: Int {
//    switch self {
//    case .noteOff,
//         .noteOn,
//         .polyKeyPressure,
//         .controlChange,
//         .pitchBend,
//         .songPositionPointer:
//      return 2
//    case .programChange,
//         .channelPressure,
//         .timeCodeQuarterFrame,
//         .songSelect:
//      return 1
//    case .systemExclusive:
//      return 0
//    case .tuneRequest,
//         .endOfExclusive,
//         .timingClock,
//         .start,
//         .continue,
//         .stop,
//         .activeSensing,
//         .systemReset:
//      return 0
//    }
//  }
//}
//



// MARK: - HELPERS

private extension UInt8 {
  var isStatus: Bool {
    return self & 0b10000000 == 0b10000000
  }

  var messageType: UInt8 {
    return (self & 0b01110000) >> 4
  }
  
  var channelIndex: UInt8 {
    return (self & 0b00001111)
  }  
}


