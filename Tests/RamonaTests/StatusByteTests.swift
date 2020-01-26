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
  
  
  func testMessageType() {
    try! XCTAssertEqual(StatusByte(byte: 0b1111_1111).topNibble, 0b111)
    try! XCTAssertEqual(StatusByte(byte: 0b1000_1111).topNibble, 0b000)
    try! XCTAssertEqual(StatusByte(byte: 0b1010_1111).topNibble, 0b010)
  }
  
  
  func testChannelIndex() {
    try! XCTAssertEqual(StatusByte(byte: 0b1000_1111).bottomNibble, 0b1111)
    try! XCTAssertEqual(StatusByte(byte: 0b1000_0000).bottomNibble, 0b0000)
    try! XCTAssertEqual(StatusByte(byte: 0b1000_0101).bottomNibble, 0b0101)
  }
  
  
  func testRoundTrip() {
    (0b1000_0000...UInt8.max).forEach { byte in
      _ = try! XCTAssertEqual(StatusByte(byte: byte).byte, byte)
    }
  }
}
