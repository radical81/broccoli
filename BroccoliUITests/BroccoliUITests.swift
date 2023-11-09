import XCTest

final class BroccoliUITests: XCTestCase {
  let app = XCUIApplication()
  
  func testMainScreenDisplay() throws {
    app.launch()
    let mainHeading = app.staticTexts["mainHeading"]
    let requestInviteButton = app.buttons["requestInviteButton"]
    XCTAssertTrue(mainHeading.exists)
    XCTAssertTrue(requestInviteButton.exists)
  }
}
