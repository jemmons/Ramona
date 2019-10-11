import Foundation
import CoreMIDI



public class Endpoint: MIDIObject {
  public let ref: MIDIEndpointRef
  
  
  internal init(ref: MIDIEndpointRef) {
    self.ref = ref
  }
}



// MARK: - PUBLIC
public extension Endpoint {
  var entity: Entity? {
    var entityRef: MIDIEntityRef = .zero
    switch MIDIEndpointGetEntity(ref, &entityRef) {
    case noErr:
      return Entity(ref: entityRef)
    default:
      return nil
    }
  }
}
