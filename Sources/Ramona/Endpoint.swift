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
  static var allSources: [Endpoint] {
    return (0 ..< MIDIGetNumberOfSources())
      .map(MIDIGetSource)
      .map(Endpoint.init(ref:))
  }
  
  
  static var allDestinations: [Endpoint] {
    return (0 ..< MIDIGetNumberOfDestinations())
      .map(MIDIGetDestination)
      .map(Endpoint.init(ref:))
  }
  
  
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
