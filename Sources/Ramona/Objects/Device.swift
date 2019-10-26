import Foundation
import CoreMIDI



public class Device: MIDIObject {
  public let ref: MIDIDeviceRef

  
  internal init(ref: MIDIDeviceRef) {
    self.ref = ref
  }
}



// MARK: - PUBLIC {
public extension Device {
  static var all: [Device] {
    return (0 ..< MIDIGetNumberOfDevices())
      .map(MIDIGetDevice)
      .map(Device.init(ref:))
  }
  
  
  var entities: [Entity] {
    return (0 ..< MIDIDeviceGetNumberOfEntities(ref))
      .map { MIDIDeviceGetEntity(ref, $0) }
      .map(Entity.init(ref:))
  }
}



// MARK: - PRIVATE
private extension Device{
}
