import Foundation
import CoreMIDI




public struct Message {
  let timestamp: MIDITimeStamp
  let data: Data
  
  public init(data: Data, timestamp: MIDITimeStamp) {
    self.timestamp = timestamp
    self.data = data
  }
}



// MARK: - PUBLIC
public extension Message {
  static func messages(from data: Data, timestamp: MIDITimeStamp) -> [Message] {
    // Though it doesn’t allow for running status, CoreMIDI sometimes packs multiple messages with the same timestamp into a single `MIDIPacket` with `data` some multiple of the expected size. See https://stackoverflow.com/a/21183297 for details.
    #warning("Need to parse data — perhaps into multiple messages.")
    return [Message(data: data, timestamp: timestamp)]
  }
}
