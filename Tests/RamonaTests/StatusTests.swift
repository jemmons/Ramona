import Foundation
import XCTest
import Ramona



class StatusTest: XCTestCase {
  func testNoStatusBit() {
    (UInt8.zero ..< 0b1000_0000).forEach { byte in
      do {
        _ = try StatusByte(byte: byte)
        XCTFail()
      } catch StatusByte.Error.noStatusFlag {
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
    try! XCTAssertEqual(StatusByte(byte: 0b1111_1111).messageType, 0b111)
    try! XCTAssertEqual(StatusByte(byte: 0b1000_1111).messageType, 0b000)
    try! XCTAssertEqual(StatusByte(byte: 0b1010_1111).messageType, 0b010)
  }
  
  
  func testChannelIndex() {
    try! XCTAssertEqual(StatusByte(byte: 0b1000_1111).channelIndex, 0b1111)
    try! XCTAssertEqual(StatusByte(byte: 0b1000_0000).channelIndex, 0b0000)
    try! XCTAssertEqual(StatusByte(byte: 0b1000_0101).channelIndex, 0b0101)
  }
}
