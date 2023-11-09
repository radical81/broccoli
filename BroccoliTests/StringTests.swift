//
//  StringTests.swift
//  BroccoliTests
//
//  Created by Rex Jason Alobba on 9/11/2023.
//

import XCTest
@testable import Broccoli

final class StringTests: XCTestCase {

  func testEmailValidation() throws {
    XCTAssertTrue("rex@abc.com".isValidEmail)
    XCTAssertTrue("abc.123@site.com".isValidEmail)
    XCTAssertFalse("123123".isValidEmail)
    XCTAssertFalse("www.google.com".isValidEmail)
  }
}
