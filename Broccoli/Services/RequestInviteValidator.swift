import Foundation

/// Validator functions for user input in the request an invite form.
struct RequestInviteValidator {
  // Properties
  var name: String
  var email: String
  var confirmEmail: String

  init(name: String, email: String, confirmEmail: String) {
    self.name = name
    self.email = email
    self.confirmEmail = confirmEmail
  }

  // Constants
  let minimumNameLength = 3

  /// True if the name input is valid
  private var isValidName: Bool {
    name.hasMinimum(minimumNameLength)
  }
  
  /// True if the email input is valid
  private func isValidEmailAddress(_ emailAddress: String) -> Bool {
    emailAddress.isValidEmail
  }
  
  /// True if the request an invite input is valid
  var isValidRequestAnInvite: Bool {
    isValidName && isValidEmailAddress(email) && isValidEmailAddress(confirmEmail) && email == confirmEmail
  }
}
