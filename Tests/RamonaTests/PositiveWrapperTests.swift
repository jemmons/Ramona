import XCTest
import Ramona



class PositiveWrapperTests: XCTestCase {
  @Positive var intDefault: Int = 500
  @Positive var intNegatigeDefault: Int = -500
  @Positive var floatDefault: Double = 500.123
  @Positive var floatNegatigeDefault: Double = -500.123

  
  func testIntDefault() {
    XCTAssertEqual(500, intDefault)
  }
  
  
  func testIntNegativeDefault() {
    XCTAssertEqual(0, intNegatigeDefault)
  }
  
  
  func testFloatDefault() {
    XCTAssertEqual(500.123, floatDefault)
  }
  
  
  func testFloatNegativeDefault() {
    XCTAssertEqual(0, floatNegatigeDefault)
  }
  
  
  func testIntAssignment() {
    intDefault = 20
    XCTAssertEqual(20, intDefault)
  }
  
  
  func testIntNegativeAssignment() {
    intDefault = -42
    XCTAssertEqual(0, intDefault)
  }
}
