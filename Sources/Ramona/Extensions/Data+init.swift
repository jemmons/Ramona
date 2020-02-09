import Foundation


// Probably premature optimization, but benchmarks show that inserting bytes directly (instead of wrapping them in sequences) take an order of magnetude less time, even with optimization on. We do a lot of byte manipulation, so this feels like a win.
internal extension Data {
  init(byte: UInt8) {
    self.init(repeating: byte, count: 1)
  }


  init(byte: ByteConvertible) {
    self.init(byte: byte.byte)
  }


  init(byte1: UInt8, byte2: UInt8) {
    var buf = Data(byte: byte1)
    buf.append(Data(byte: byte2))
    self = buf
  }



  init(byte1: ByteConvertible, byte2: ByteConvertible) {
    self.init(byte1: byte1.byte, byte2: byte2.byte)
  }


  init(byte1: UInt8, byte2: UInt8, byte3: UInt8) {
    var buf = Data(byte: byte1)
    buf.append(Data(byte: byte2))
    buf.append(Data(byte: byte3))
    self = buf
  }


  init(byte1: ByteConvertible, byte2: ByteConvertible, byte3: ByteConvertible) {
    self.init(byte1: byte1.byte, byte2: byte2.byte, byte3: byte3.byte)
  }
  
  
  init(byte: UInt8, data: Data) {
    var buf = Data(byte: byte)
    buf.append(data)
    self = buf
  }
  
  
  init(byte: ByteConvertible, data: MultibyteConvertible) {
    self.init(byte: byte.byte, data: data.data)
  }
}
