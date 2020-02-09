import Foundation
import CoreMIDI


public typealias Packet = (timestamp: MIDITimeStamp, messages: [Message])
public typealias PacketHash = [MIDITimeStamp: [Message]]

public struct PacketList: Sequence {
  private let midiPacketList: MIDIPacketList
  public let underestimatedCount: Int
  public typealias Element = Packet
  
  
  public init(pointer: UnsafePointer<MIDIPacketList>) {
    midiPacketList = pointer.pointee
    underestimatedCount = Int(midiPacketList.numPackets)
  }
  
  
  public func makeIterator() -> AnyIterator<Element> {
    var midiPacket = midiPacketList.packet
    var numberOfPackets = underestimatedCount
    
    return AnyIterator {
      guard numberOfPackets > 0 else {
        return nil
      }
      
      defer {
        numberOfPackets -= 1
        midiPacket = MIDIPacketNext(&midiPacket).pointee
      }
      
      let length = Int(midiPacket.length)
      var data: Data = Data()
      withUnsafePointer(to: &midiPacket.data) { pointer -> Void in
        data = Data(bytes: pointer, count: length)
      }
      
      return (midiPacket.timeStamp, Helper.makeMessages(from: data))
    }
  }
}



private enum Helper {
  static func makeMessages(from data: Data) -> [Message] {
    return parse(data: data).compactMap { statusByte, messageData in
      try? Message(status: statusByte, data: messageData)
    }
  }
  
  
  private static func parse(data: Data) -> [(StatusByte, MessageData)] {
    return data.reduce(into: [(StatusByte, MessageData)]()) { result, next in
      do {
        try result.append((StatusByte(byte: next), MessageData()))
      } catch {
        result.indices.last.map {
          if let dataByte = try? AnyDataByte(byte: next) {
            _ = try? result[$0].1.append(dataByte)
          }
        }
      }
    }
  }
}
