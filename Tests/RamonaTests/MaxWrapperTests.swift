import XCTest
import Ramona



class MaxWrapperTests: XCTestCase {
  @Max(including: 100) var includingInt: Int = 50
  @Max(including: 100) var includingIntClamped: Int = 150
  @Max(including: 100.123) var includingFloat: Double = 100.0
  @Max(including: 100.123) var includingFloatClamped: Double = 150.0
  @Max(including: 100) var includingIntNegative: Int = -100

  @Max(bits: 7) var bitsInt: Int = 0
  @Max(bits: 7) var bitsFloat: Double = 0
  
  
  func testIntDefault() {
    XCTAssertEqual(50, includingInt)
  }
  
  
  func testIntClampedDefault() {
    XCTAssertEqual(100, includingIntClamped)
  }
  
  
  func testFloatDefault() {
    XCTAssertEqual(100.0, includingFloat)
  }
  
  
  func testFloatClampedDefault() {
    XCTAssertEqual(100.123, includingFloatClamped)
  }
  
  
  func testNegativeDefault() {
    XCTAssertEqual(-100, includingIntNegative)
  }
  
  
  func testIntAssignment() {
    includingInt = 99
    XCTAssertEqual(99, includingInt)
    
    includingInt = -100
    XCTAssertEqual(-100, includingInt)
    
    includingInt = 150
    XCTAssertEqual(100, includingInt)
  }
  
  
  func testFloatAssignment() {
    includingFloat = 99.9
    XCTAssertEqual(99.9, includingFloat)
    
    includingFloat = -100.1
    XCTAssertEqual(-100.1, includingFloat)
    
    includingFloat = 1000.1
    XCTAssertEqual(100.123, includingFloat)
  }
  
  
  func testIntBits() {
    XCTAssertEqual(0, bitsInt)
    
    bitsInt = 100
    XCTAssertEqual(100, bitsInt)
    
    bitsInt = -100
    XCTAssertEqual(-100, bitsInt)
    
    bitsInt = 1000
    XCTAssertEqual(127, bitsInt)
  }
  
  
  func testFloatBits() {
    XCTAssertEqual(0, bitsFloat)
    
    bitsFloat = 99.9
    XCTAssertEqual(99.9, bitsFloat)
    
    bitsFloat = -99.99
    XCTAssertEqual(-99.99, bitsFloat)
    
    bitsFloat = 1000.123
    XCTAssertEqual(127, bitsFloat)
  }
}
