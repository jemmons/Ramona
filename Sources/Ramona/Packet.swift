import Foundation
import CoreMIDI



struct Packet {
  let timeStamp: MIDITimeStamp
  let messages: [Message]

  init(timeStamp: MIDITimeStamp, data: Data) {
    self.timeStamp = timeStamp
    messages = Helper.makeMessages(from: data)
  }
}



private enum Helper {
  static func makeMessages(from data: Data) -> [Message] {
    return split(data: data).compactMap { status, data in
      try? Message.init(status: status, data: data)
    }
  }
  
  
  private static func split(data: Data) -> [(Status, Data)] {
    return data.reduce(into: [(Status, Data)]()) { result, next in
      do {
        try result.append((Status(byte: next), Data()))
      } catch {
        result.indices.last.map { result[$0].1.append(next) }
      }
    }
  }
}
