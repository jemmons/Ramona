import Foundation
import CoreMIDI




public enum Message {
  case noteOff(Channel, Note, Value)
  case noteOn(Channel, Note, Value)
  case polyphonicAftertouch(Channel, Note, Value)
  case controlChange(Channel, Control, Value)
  case programChange(Channel, Value)
  case channelAftertouch(Channel, Value)
  case pitchBend(Channel, DoubleValue)

  
  public enum Throwable: LocalizedError {
    case noData
    case noStatus

    public var errorDescription: String? {
      switch self {
      case .noData:
        return "No MIDI message found."
      case .noStatus:
        return "No status bit found in MIDI message."
      }
    }
  }
  
  
  internal init(inout data: Data) throws {
    guard !data.isEmpty else {
      throw Throwable.noData
    }
    guard data.first!
  }
}



// MARK: - PUBLIC
public extension Message {
  static func parseMessages(from data: Data) -> [Message] {
    var messages: [Message] = []
    
    var mutableData = data
    let first = mutableData.removeFirst()
    guard let newChannel = first.channel else {
      return messages
    }
    let statusByte = first & 0b01110000
    
    (try? Event(statusByte: statusByte, data: &<#T##Data#>: eventCode, data: &mutableData)).flatMap(messages.append)
    
    
    // Though it doesn’t allow for running status, CoreMIDI sometimes packs multiple messages with the same timestamp into a single `MIDIPacket` with `data` some multiple of the expected size. See https://stackoverflow.com/a/21183297 for details.
    #warning("Need to parse data — perhaps into multiple messages.")
    return [Message(timestamp: timestamp, channel: .ch1, event: .channelAftertouch(Value(127)))]
  }
}



private enum Helper {
//  static func parseMessage
}


private extension UInt8 {
  var isStatus: Bool {
    return self & 0b10000000 == 128
  }
  
  var channel: Channel? {
    guard isStatus else {
      return nil
    }
    return Channel(rawValue: Int(self & 0b00001111))
  }
  
  var event: Event? {
    guard isStatus else {
      return nil
    }
    return Event(self & 0b01110000)
  }
}
