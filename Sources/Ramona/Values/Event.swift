import Foundation
import CoreMIDI



public struct Event {
  public let timeStamp: MIDITimeStamp
  public let message: Message
  
  
  init(timeStamp: MIDITimeStamp, message: Message) {
    self.timeStamp = timeStamp
    self.message = message
  }
}



// MARK: - PUBLIC
public extension Event {
  static func makeEvents(timeStamp: MIDITimeStamp, data: Data) -> [Event] {
    return Message.parseMessages(from: data).map { Event(timeStamp: timeStamp, message: $0) }
    
  }
}
