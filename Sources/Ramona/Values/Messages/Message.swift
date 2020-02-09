import Foundation
import CoreMIDI



public enum Message {
  case channel(ChannelMessage)
  case system(SystemMessage)
  
  public init(status: StatusByte, data: MessageData) throws {
    switch (status.topNibble, status.bottomNibble) {
    case (.systemMessage, let type):
      self = try .system(SystemMessage(typeNibble: type, data: data))
    case (let type, let channel):
      self = try .channel(ChannelMessage(type: type, channel: Channel(nibble: channel), data: data))
    }
  }
}



extension Message: MultibyteConvertible {
  public var data: Data {
    switch self {
    case .channel(let message):
      return message.data
    case .system(let message):
      return message.data
    }
  }
}



public extension Message {
  enum Error: LocalizedError {
    case undefined
    
    public var errorDescription: String? {
      switch self {
      case .undefined:
        return "This message is left undefined by the MIDI spec."
      }
    }
  }
}
