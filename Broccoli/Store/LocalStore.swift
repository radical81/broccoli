import Foundation

/// Convenience functions for managing local store.
struct LocalStore {
  /// The key
  static let key = "registered"

  /// Retrieve all registered emails.
  private static var registeredEmails: [String] {
    guard let registered = UserDefaults.standard.array(forKey: key) as? [String] else {
      return []
    }
    return registered
  }
  
  /// Add email to registry.
  static func register(_ email: String) {
    var registered = registeredEmails
    if !registered.contains(email) {
      registered.append(email)
      UserDefaults.standard.set(registered, forKey: key)
    }
  }
  
  /// Remove email from registry.
  static func cancelRegistration(_ email: String) {
    var registered = registeredEmails
    if registered.contains(email) {
      registered.removeAll(where: { $0 == email })
      UserDefaults.standard.set(registered, forKey: key)
    }
  }
  
  /// True if email is already registered.
  static func isRegistered(_ email: String) -> Bool {
    registeredEmails.contains(email)
  }
}
