import Foundation
import CoreMIDI



public class Entity {
  private let ref: MIDIEntityRef
  
  
  internal init(ref: MIDIEntityRef) {
    self.ref = ref
  }
}



// MARK: - PUBLIC
public extension Entity {
  var sources: [Endpoint] {
    return (0 ..< MIDIEntityGetNumberOfSources(ref))
      .map { MIDIEntityGetSource(ref, $0) }
      .map(Endpoint.init(ref:))
  }
  
  
  var destinations: [Endpoint] {
    return (0 ..< MIDIEntityGetNumberOfDestinations(ref))
      .map { MIDIEntityGetDestination(ref, $0) }
      .map(Endpoint.init(ref:))
  }
  
  
  var device: Device? {
    var deviceRef: MIDIDeviceRef = .zero
    switch MIDIEntityGetDevice(ref, &deviceRef) {
    case noErr:
      return Device(ref: deviceRef)
    default:
      return nil
    }
  }
}
