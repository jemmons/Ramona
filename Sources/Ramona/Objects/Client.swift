import Foundation
import CoreMIDI



public class Client {
  private let ref: MIDIClientRef
  
  
  public init(name: String) throws {
    var newRef: MIDIClientRef = .zero
    switch MIDIClientCreateWithBlock(name as CFString, &newRef, nil) {
    case noErr:
      ref = newRef
    
    case let code:
      throw NSError(domain: NSOSStatusErrorDomain, code: Int(code), userInfo: nil)
    }
  }
}



// MARK: - PUBLIC
public extension Client {
  @discardableResult func makeInput(_ name: String, source: Endpoint, inputHandler: @escaping ([Message]) -> Void) throws -> Port {
    var portRef: MIDIPortRef = .zero
    let portStatus = MIDIInputPortCreateWithBlock(ref, name as CFString, &portRef) { (packetListPointer: UnsafePointer<MIDIPacketList>, reference: UnsafeMutableRawPointer?) in
      let list = packetListPointer.pointee
      var messages: [Message] = []
      
      var packet: MIDIPacket = list.packet
      for _ in 0 ..< list.numPackets {
        let time = packet.timeStamp
        let length = Int(packet.length)
        var data: Data = Data()
        withUnsafePointer(to: &packet.data) { pointer -> Void in
          data = Data(bytes: pointer, count: length)
        }
        
        #warning("Do… something here?")
//        messages += Message.messages(from: data, timestamp: time)
        
        packet = MIDIPacketNext(&packet).pointee
      }
      inputHandler(messages)
    }
    
    let port: Port
    switch portStatus {
    case noErr:
      port = Port(ref: portRef)
    case let code:
      throw NSError(domain: NSOSStatusErrorDomain, code: Int(code), userInfo: nil)
    }
    
    try port.connect(to: source)
    return port
  }
}
