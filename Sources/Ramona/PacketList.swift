import Foundation
import CoreMIDI


struct PacketList: Sequence {
  let midiPacketList: MIDIPacketList
  let underestimatedCount: Int
  typealias Element = Packet
  
  
  init(pointer: UnsafePointer<MIDIPacketList>) {
    midiPacketList = pointer.pointee
    underestimatedCount = Int(midiPacketList.numPackets)
  }
  
  
  func makeIterator() -> AnyIterator<Element> {
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

      return Packet(timeStamp: midiPacket.timeStamp, data: data)
    }
  }
}
