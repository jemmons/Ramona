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
    return parse(data: data).compactMap { statusByte, dataBytes in
      try? Message.init(status: statusByte, data: dataBytes)
    }
  }
  
  
  private static func parse(data: Data) -> [(StatusByte, [DataByte])] {
    return data.reduce(into: [(StatusByte, [DataByte])]()) { result, next in
      do {
        try result.append((StatusByte(byte: next), []))
      } catch {
        result.indices.last.map {
          if let dataByte = try? DataByte(byte: next) {
            result[$0].1.append(dataByte)
          }
        }
      }
    }
  }
}
