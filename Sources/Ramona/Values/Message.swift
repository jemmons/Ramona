import Foundation
import CoreMIDI


public typealias Pressure = Int
public typealias ControlValue = Int
public typealias Program = Int
public typealias PitchChange = Int

public enum Message {
  case noteOff(channel: Channel, note: Note, velocity: Velocity)
  case noteOn(channel: Channel, note: Note, velocity: Velocity)
  case polyKeyPressure(channel: Channel, note: Note, pressure: Pressure)
  case controlChange(channel: Channel, control: Control, value: ControlValue)
  case programChange(channel: Channel, program: Program)
  case channelPressure(channel: Channel, pressure: Pressure)
  case pitchBend(channel: Channel, change: PitchChange)
  case timeCodeQuarterFrame(fragment: SMPTEFragment)
  case songPositionPointer(beatCount: Int)
  case songSelect(index: Int)
  case tuneRequest
  case timingClock
  case start
  case `continue`
  case stop
  case activeSensing
  case systemReset
  
  public enum Error: LocalizedError {
    case missingMessage
    case missingData
    case notData
    case invalidData
    case invalidStatus
    
    public var errorDescription: String? {
      switch self {
      case .missingMessage:
        return "No MIDI message found."
      case .invalidStatus:
        return "The status byte could not be parsed."
      case .missingData:
        return "There is insufficiant data for this message."
      case .invalidData:
        return "The data for this message is invalid."
      case .notData:
        return "The status flag for this data is set."
      }
    }
  }
  
  
//  internal init(data: inout Data) throws {
//    guard let statusByte = data.popFirst() else {
//      throw Error.missingMessage
//    }
//
//    guard let status = try? Status(byte: statusByte) else {
//      throw Error.invalidStatus
//    }
//
//    guard let dataBytes = data.popFirst(status.numberOfDataBytes) else {
//      throw Error.missingData
//    }
//
//    try self.init(status: status, data: dataBytes)
//  }
//
//
  init(data: Data) {
    self = .noteOn(channel: .ch1, note: .a0, velocity: .ff)
  }
  
  internal init(status: Status, data: Data) throws {
    self = .noteOn(channel: .ch1, note: .a0, velocity: .ff)
    
//    guard data.count == status.numberOfDataBytes else {
//      throw Error.invalidData
//    }
//
//    switch status {
//    case .noteOff(let c):
//      let (key, vel) = try Helper.ints(from: data)
//      self = .noteOff(channel: c, note: Note(key), velocity: Velocity(vel))
//
//    case .noteOn(let c):
//      let (key, vel) = try Helper.ints(from: data)
//      self = .noteOn(channel: c, note: Note(key), velocity: Velocity(vel))
//
//    case .polyKeyPressure(let c):
//      let (key, pressure) = try Helper.ints(from: data)
//      self = .polyKeyPressure(channel: c, note: Note(key), pressure: pressure)
//
//    case .controlChange(let c):
//      let (control, value) = try Helper.ints(from: data)
//      #warning("going to need a lot of controls")
//      self = .controlChange(channel: c, control: Control(), value: value)
//
//    case .programChange(let c):
//      self = try .programChange(channel: c, program: Helper.int(from: data))
//
//    case .channelPressure(let c):
//      self = try .channelPressure(channel: c, pressure: Helper.int(from: data))
//
//    case .pitchBend(let c):
//      self = try .pitchBend(channel: c, change: Helper.long(from: data))
//
//    case .systemExclusive:
//      #warning("need to figure out sysex works")
//      fatalError("sysex")
//
//    case .timeCodeQuarterFrame:
//      self = try .timeCodeQuarterFrame(fragment: Helper.fragment(from: data))
//
//    case .songPositionPointer:
//      self = try .songPositionPointer(beatCount: Helper.long(from: data))
//
//    case .songSelect:
//      self = try .songSelect(index: Helper.int(from: data))
//
//    case .tuneRequest:
//      self = .tuneRequest
//
//    case .endOfExclusive:
//      #warning("Figure out how sysex works.")
//      fatalError("sysex")
//
//    case .timingClock:
//      self = .timingClock
//    case .start:
//      self = .start
//    case .continue:
//      self = .continue
//    case .stop:
//      self = .stop
//    case .activeSensing:
//      self = .activeSensing
//    case .systemReset:
//      self = .systemReset
//    }
  }
}



// MARK: - PUBLIC
public extension Message {
  //  static func parseMessages(from data: Data) -> [Message] {
  //    var messages: [Message] = []
  //
  //    var mutableData = data
  //    let first = mutableData.removeFirst()
  //    guard let newChannel = first.channel else {
  //      return messages
  //    }
  //    let statusByte = first & 0b01110000
  //
  //    (try? Event(statusByte: statusByte, data: &<#T##Data#>: eventCode, data: &mutableData)).flatMap(messages.append)
  //
  //
  //    // Though it doesn’t allow for running status, CoreMIDI sometimes packs multiple messages with the same timestamp into a single `MIDIPacket` with `data` some multiple of the expected size. See https://stackoverflow.com/a/21183297 for details.
  //    #warning("Need to parse data — perhaps into multiple messages.")
  //    return [Message(timestamp: timestamp, channel: .ch1, event: .channelAftertouch(Value(127)))]
  //  }
}



// MARK: - HELPERS
private enum Helper {
  static func ints(from data: [UInt8]) throws -> (Int, Int) {
    guard data.allSatisfy({ $0.isData }) else {
      throw Message.Error.notData
    }
    guard data.count == 2 else {
      throw Message.Error.invalidData
    }
    return (Int(data[0]), Int(data[1]))
  }
  
  
  static func int(from data: [UInt8]) throws -> Int {
    guard data.allSatisfy({ $0.isData }) else {
      throw Message.Error.notData
    }
    guard data.count == 1 else {
      throw Message.Error.invalidData
    }
    return Int(data[0])
  }
  
  
  static func long(from data: [UInt8]) throws -> Int {
    guard data.allSatisfy({ $0.isData }) else {
      throw Message.Error.notData
    }
    guard data.count == 2 else {
      throw Message.Error.invalidData
    }
    return Int(data[0] | (data[1] << 7))
  }
  
  
  static func fragment(from data: [UInt8]) throws -> SMPTEFragment {
    guard data.allSatisfy({ $0.isData }) else {
      throw Message.Error.notData
    }
    guard data.count == 1 else {
      throw Message.Error.invalidData
    }
    let byte = data[0]
    let nibble = Int(byte & 0b0000_1111)
    let type = byte & 0b0111_0000
    switch type {
    case 0: return .leastSignificantFrame(nibble)
    case 1: return .mostSignificantFrame(nibble)
    case 2: return .leastSignificantSecond(nibble)
    case 3: return .mostSignificantSecond(nibble)
    case 4: return .leastSignificantMinute(nibble)
    case 5: return .mostSignificantMinute(nibble)
    case 6: return .leastSignificantHour(nibble)
    case 7: return .mostSignificantHour(nibble)
    default: fatalError("Integers are broken.")
    }
  }
}


private extension UInt8 {
  var isData: Bool {
    return (self & 0b1000_0000) == 0b0000_0000
  }
}



private extension Data {
  mutating func popFirst(_ count: Int) -> [UInt8]? {
    let subdata = (0 ..< count).map { _ in
      self.popFirst()
    }.compactMap { $0 }
    
    guard subdata.count == count else {
      return nil
    }
    
    return subdata
  }
}



//guard byte.isStatus else {
//  throw Error.noStatusFlag
//}
//
//switch byte.statusCode {
//case 0b000:
//  self = .noteOff(byte.channel)
//case 0b001:
//  self = .noteOn(byte.channel)
//case 0b010:
//  self = .polyKeyPressure(byte.channel)
//case 0b011:
//  self = .controlChange(byte.channel)
//case 0b100:
//  self = .programChange(byte.channel)
//case 0b101:
//  self = .channelPressure(byte.channel)
//case 0b110:
//  self = .pitchBend(byte.channel)
//case 0b111:
//  switch byte.systemCode {
//  case 0b0000:
//    self = .systemExclusive
//  case 0b0001:
//    self = .timeCodeQuarterFrame
//  case 0b0010:
//    self = .songPositionPointer
//  case 0b0011:
//    self = .songSelect
//  case 0b0100,
//       0b0101:
//    throw Error.unknown
//  case 0b0110:
//    self = .tuneRequest
//  case 0b0111:
//    self = .endOfExclusive
//  case 0b1000:
//    self = .timingClock
//  case 0b1001:
//    throw Error.unknown
//  case 0b1010:
//    self = .start
//  case 0b1011:
//    self = .continue
//  case 0b1100:
//    self = .stop
//  case 0b1101:
//    throw Error.unknown
//  case 0b1110:
//    self = .activeSensing
//  case 0b1111:
//    self = .systemReset
//  default:
//    fatalError("Integers are broken.")
//  }
//default:
//  fatalError("Integers are broken.")
//}
