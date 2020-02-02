import Foundation


// Probably premature optimization, but benchmarks show that inserting bytes directly (instead of wrapping them in sequences) take an order of magnetude less time, even with optimization on. We do a lot of byte manipulation, so this feels like a win?
internal extension Data {
  init(byte: UInt8) {
    self.init(repeating: byte, count: 1)
  }


  init(byte1: UInt8, byte2: UInt8) {
    self = Data(byte: byte1) + Data(byte: byte2)
  }



  init(byte1: UInt8, byte2: UInt8, byte3: UInt8) {
    self = Data(byte: byte1) + Data(byte: byte2) + Data(byte: byte3)
  }
}
