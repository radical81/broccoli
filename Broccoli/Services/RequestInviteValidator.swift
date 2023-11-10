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

  /// True if all fields are empty.
  var allEmpty: Bool {
    name.isEmpty && email.isEmpty && confirmEmail.isEmpty
  }
  
  /// True if the name input is valid
  var isValidName: Bool {
    name.hasMinimum(minimumNameLength)
  }
  
  /// True if the email input is valid
  var isValidEmailAddress: Bool {
    email.isValidEmail
  }
  
  /// True if the confirm email input is valid
  var isValidConfirmEmailAddress: Bool {
    confirmEmail.isValidEmail
  }
  
  /// True if the email addresses match.
  var emailAddressesMatch: Bool {
    email == confirmEmail
  }
  
  /// True if the request an invite input is valid
  var isValidRequestAnInvite: Bool {
    isValidName && isValidEmailAddress && isValidConfirmEmailAddress && emailAddressesMatch
  }
}
