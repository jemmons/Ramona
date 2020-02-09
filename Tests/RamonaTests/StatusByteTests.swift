import Foundation
import XCTest
import Ramona



class StatusByteTest: XCTestCase {
  func testNoStatusBit() {
    (UInt8.zero ..< 0b1000_0000).forEach { byte in
      do {
        _ = try StatusByte(byte: byte)
        XCTFail()
      } catch StatusBitError.isNotSet {
        XCTAssert(true)
      } catch {
        XCTFail()
      }
    }
  }
  
  
  func testMitStatusBit() {
    (0b1000_0000...UInt8.max).forEach { byte in
      _ = try! StatusByte(byte: byte)
    }
    XCTAssert(true)
  }
  
  
  func testRoundTrip() {
    (0b1000_0000...UInt8.max).forEach { byte in
      _ = try! XCTAssertEqual(StatusByte(byte: byte).byte, byte)
    }
  }
}
