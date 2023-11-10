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
  
  func testRequestAnInviteDisplay() throws {
    app.launch()
    let requestInviteButton = app.buttons["requestInviteButton"]
    let requestInviteTitle = app.staticTexts["Request an invite"]
    let nameTextField = app.textFields["nameTextField"]
    let emailTextField = app.textFields["emailTextField"]
    let confirmEmailTextField = app.textFields["confirmEmailTextField"]
    let sendButton = app.buttons["sendButton"]
    requestInviteButton.tap()
    XCTAssertTrue(requestInviteTitle.exists)
    XCTAssertTrue(nameTextField.exists)
    XCTAssertTrue(emailTextField.exists)
    XCTAssertTrue(confirmEmailTextField.exists)
    XCTAssertTrue(sendButton.exists)    
  }
}
