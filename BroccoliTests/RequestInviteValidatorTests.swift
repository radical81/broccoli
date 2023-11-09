import XCTest
@testable import Broccoli

final class RequestInviteValidatorTests: XCTestCase {
  
  /// Tests if user input is valid for the request invite form.
  func testValidRequestInviteInput() throws {
    var request = RequestInviteValidator(name: "Rex", email: "rexa@abc.com", confirmEmail: "rexa@abc.com")
    XCTAssertTrue(request.isValidRequestAnInvite)
    request = RequestInviteValidator(name: "Re", email: "rexa@abc.com", confirmEmail: "rexa@abc.com")
    XCTAssertFalse(request.isValidRequestAnInvite)
    request = RequestInviteValidator(name: "Rex", email: "rexa@abc.comm", confirmEmail: "rexa@abc.com")
    XCTAssertFalse(request.isValidRequestAnInvite)
    request = RequestInviteValidator(name: "Rex", email: "rexabc.com", confirmEmail: "rexabc.com")
    XCTAssertFalse(request.isValidRequestAnInvite)
  }
}
