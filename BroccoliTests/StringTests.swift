import XCTest
@testable import Broccoli

final class StringTests: XCTestCase {

  /// Tests valid email formats.
  func testEmailValidation() throws {
    XCTAssertTrue("rex@abc.com".isValidEmail)
    XCTAssertTrue("abc.123@site.com".isValidEmail)
    XCTAssertFalse("123123".isValidEmail)
    XCTAssertFalse("www.google.com".isValidEmail)
  }
}
