import Foundation

/// Convenience properties and methods for the String type.
extension String {
  /// Returns true if the string is in a  valid email format.
  var isValidEmail: Bool {
    NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
  }
}
