import Foundation
import CoreMIDI



public protocol MIDIObject {
  var ref: MIDIObjectRef { get }
}


public extension MIDIObject {
  var name: String? {
    return getStringProperty(kMIDIPropertyName)
  }


  var displayName: String? {
    return getStringProperty(kMIDIPropertyDisplayName)
  }
}



private extension MIDIObject {
  func getStringProperty(_ name: CFString) -> String? {
    var stringPointer: Unmanaged<CFString>? = nil
    MIDIObjectGetStringProperty(ref, name, &stringPointer)
    //This seems like it ought to take unretained, instead? CoreMIDI docs are ambiguous (it talks about receiving a “Core Foundation object as a *return* value from a MIDI function” but not pass-by-ref pointers). But sample code at https://developer.apple.com/library/archive/qa/qa1374/_index.html definitely releases the CFStringRef retruned from this. So I’m assuming we get back a CFString with a +1.
    return stringPointer?.takeRetainedValue() as String?
  }
}
