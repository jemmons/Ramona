import Foundation



public struct Status {
  let statusCode: Int
  let systemCode: Int

  init(byte: UInt8) throws {
    guard byte.isStatus else {
      throw Error.noStatusFlag
    }
    statusCode = Int(byte.statusCode)
    systemCode = Int(byte.systemCode)
  }
}



public extension Status {
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

  var statusCode: UInt8 {
    return (self & 0b01110000) >> 4
  }
  
  var systemCode: UInt8 {
    return (self & 0b00001111)
  }  
}


