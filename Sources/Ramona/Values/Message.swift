import Foundation
import CoreMIDI



public enum Message {
  case noteOff(channel: Channel, note: Note, velocity: Velocity)
  case noteOn(channel: Channel, note: Note, velocity: Velocity)
  case polyKeyPressure(channel: Channel, note: Note, pressure: Pressure)
  case controlChange(channel: Channel, control: Control)
  case programChange(channel: Channel, program: Program)
  case channelPressure(channel: Channel, pressure: Pressure)
  case pitchBend(channel: Channel, change: PitchChange)
  case timeCodeQuarterFrame(fragment: SMPTEFragment)
  case songPositionPointer(beatCount: Beats)
  case songSelect(index: Int)
  case tuneRequest
  case timingClock
  case start
  case `continue`
  case stop
  case activeSensing
  case systemReset
  
  public enum Error: LocalizedError {
    case missingData
    case undefined
    
    public var errorDescription: String? {
      switch self {
      case .missingData:
        return "There is insufficiant data for this message."
      case .undefined:
        return "This message is left undefined by the MIDI spec."
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
  
  internal init(status: StatusByte, data: [DataByte]) throws {
    switch status.messageType {
    case 0b000:
      try self = .noteOff(
        channel: Channel(status: status),
        note: Note(dataByte: data.firstByte()),
        velocity: Velocity(dataByte: data.secondByte())
      )
    case 0b001:
      try self = .noteOn(
        channel: Channel(status: status),
        note: Note(dataByte: data.firstByte()),
        velocity: Velocity(dataByte: data.secondByte())
      )
    case 0b010:
      try self = .polyKeyPressure(
        channel: Channel(status: status),
        note: Note(dataByte: data.firstByte()),
        pressure: Pressure(dataByte: data.secondByte())
      )
    case 0b011:
      #warning("Actually parse CCs")
      try self = .controlChange(
        channel: Channel(status: status),
        control: .allNotesOff
      )
    case 0b100:
      try self = .programChange(
        channel: Channel(status: status),
        program: Program(dataByte: data.secondByte())
      )
    case 0b101:
      try self = .channelPressure(
        channel: Channel(status: status),
        pressure: Pressure(dataByte: data.firstByte())
      )
    case 0b110:
      try self = .pitchBend(
        channel: Channel(status: status),
        change: PitchChange(lsb: data.firstByte(), msb: data.secondByte())
      )
    case 0b111:
      switch status.systemMessageType {
      case 0b0000:
        #warning("need to implement sysex")
        fatalError("sysex")
      case 0b0001:
        try self = .timeCodeQuarterFrame(fragment: SMPTEFragment(dataByte: data.firstByte()))
      case 0b0010:
        try self = .songPositionPointer(beatCount: Beats(lsb: data.firstByte(), msb: data.secondByte()))
      case 0b0011:
        try self = .songSelect(index: data.firstByte().value)
      case 0b0100,
           0b0101:
        throw Error.undefined
      case 0b0110:
        self = .tuneRequest
      case 0b0111:
        #warning("Implement sysex")
        fatalError("end sysex")
      }
    }
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



private extension Array where Element == DataByte {
  func firstByte() throws -> DataByte {
    guard let byte = first else {
      throw Message.Error.missingData
    }
    return byte
  }
  
  
  func secondByte() throws -> DataByte {
    guard count >= 2 else {
      throw Message.Error.missingData
    }
    return self[1]
  }
}
