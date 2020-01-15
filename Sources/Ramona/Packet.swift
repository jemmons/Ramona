import Foundation
import CoreMIDI



struct Packet {
  let timeStamp: MIDITimeStamp
  let messages: [Message]

  init(timeStamp: MIDITimeStamp, data: Data) {
    self.timeStamp = timeStamp
    messages = data
      .reduce(into: [Data]()) { result, next in
        if next.isStatusByte {
          result.append(Data(repeating: next, count: 1))
        } else {
          result.indices.last.map { i in
            result[i].append(next)
          }
        }
    }
    .map(Message.init(data:))
  }
}




private extension UInt8 {
  var isStatusByte: Bool {
    return self & 0b10000000 == 0b10000000
  }
}
