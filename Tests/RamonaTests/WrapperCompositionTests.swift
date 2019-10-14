import XCTest
import Ramona



class WrapperCompositionTests: XCTestCase {
  @Positive @Max(bits: 7) var value: Int = 50
  
  
  func testComposition() {
    XCTAssertEqual(50, value)
    
    value = -100
    XCTAssertEqual(0, value)
    
    
    value = 1000
    XCTAssertEqual(127, value)
  }
}
