import Foundation
import CoreMIDI



struct Packet {
  let timeStamp: MIDITimeStamp
  let messages: [Message]

  init(timeStamp: MIDITimeStamp, data: Data) {
    self.timeStamp = timeStamp
    messages = data
      .reduce(into: [(status: Status, data: Data)]()) { result, next in
        do {
          try result.append((Status(byte: next), Data()))
        } catch {
          result.indices.last.map { i in
            result[i].data.append(next)
          }
        }
    }
    .map { try! Message.init(status: $0.status, data: $0.data) }
    #warning("try!")
  }
}




private extension UInt8 {
  var isStatusByte: Bool {
    return self & 0b10000000 == 0b10000000
  }
}
