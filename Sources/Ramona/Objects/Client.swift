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
  @discardableResult func makeInput(_ name: String, source: Endpoint, inputHandler: @escaping (Packet) -> Void) throws -> Port {
    var portRef: MIDIPortRef = .zero
    let portStatus = MIDIInputPortCreateWithBlock(ref, name as CFString, &portRef) { packetListPointer, _ in
      PacketList(pointer: packetListPointer).forEach(inputHandler)
    }
    
    guard noErr == portStatus else {
      throw NSError(domain: NSOSStatusErrorDomain, code: Int(portStatus), userInfo: nil)
    }
    
    let port = Port(ref: portRef)
    try port.connect(to: source)
    return port
  }
}
