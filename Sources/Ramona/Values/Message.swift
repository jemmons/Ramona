import Foundation
import CoreMIDI


public typealias Program = Int
public typealias Pressure = Int

public enum Message {
  case noteOff(Channel, Note)
  case noteOn(Channel, Note)
  case polyKeyPressure(Channel, Note)
  case controlChange(Channel, Control)
  case programChange(Channel, Program)
  case channelPressure(Channel, Pressure)
  case pitchBend(Channel, Int)
  
  
  public enum Throwable: LocalizedError {
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
  
  
  internal init(data: inout Data) throws {
    guard let statusByte = data.popFirst() else {
      throw Throwable.missingMessage
    }
    
    guard let status = try? Status(byte: statusByte) else {
      throw Throwable.invalidStatus
    }
    
    guard let dataBytes = data.popFirst(status.numberOfDataBytes) else {
      throw Throwable.missingData
    }
    
    try self.init(status: status, data: dataBytes)
  }
  
  
  internal init(status: Status, data: [UInt8]) throws {
    switch status {
    case .noteOff(let c):
      let (key, vel) = try Helper.ints(from: data)
      self = .noteOff(c, Note(number: key, value: vel))
    
    case .noteOn(let c):
      let (key, vel) = try Helper.ints(from: data)
      self = .noteOn(c, Note(number: key, value: vel))
    
    case .polyKeyPressure(let c):
      let (key, pressure) = try Helper.ints(from: data)
      self = .polyKeyPressure(c, Note(number: key, value: pressure))
    
    case .controlChange(let c):
      let (control, value) = try Helper.ints(from: data)
      #warning("going to need a lot of controls")
      self = .controlChange(c, Control())
      
    case .programChange(let c):
      self = .programChange(c, Helper.int(from: data))
    
    case .channelPressure(let c):
      self = .channelPressure(c, Helper.int(from: data))
    
    case .pitchBend(let c):
      #warning("Figure out how pitchbend works.")
      self = .pitchBend(c, 64)
      
    case .systemExclusive:
      #warning("need to figure out sysex, also")
      fatalError("sysex")
    
    case .timeCodeQuarterFrame:
      
    case .songPositionPointer:
    case .songSelect:
    case .tuneRequest:
    case .endOfExclusive:
    case .timingClock:
    case .start:
    case .continue:
    case .stop:
    case .activeSensing:
    case .systemReset:
      
    }
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
      throw Message.Throwable.notData
    }
    guard data.count == 2 else {
      throw Message.Throwable.invalidData
    }
    return (Int(data[0]), Int(data[1]))
  }
  
  static func int(from data: [UInt8]) throws -> Int {
    guard data.allSatisfy({ $0.isData }) else {
      throw Message.Throwable.notData
    }
    guard data.count == 1 else {
      throw Message.Throwable.invalidData
    }
    return Int(data[0])
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
