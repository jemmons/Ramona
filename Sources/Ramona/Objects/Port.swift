import Foundation
import CoreMIDI



public class Port {
  private let ref: MIDIPortRef
  
  internal init(ref: MIDIPortRef) {
    self.ref = ref
  }
}


public extension Port {
  func connect(to source: Endpoint) throws {
    switch MIDIPortConnectSource(ref, source.ref, nil) {
    case noErr:
      break
    case let code:
      throw NSError(domain: NSOSStatusErrorDomain, code: Int(code), userInfo: nil)
    }
  }
}
