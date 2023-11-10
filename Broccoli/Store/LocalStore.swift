import Foundation

/// Convenience functions for managing local store.
struct LocalStore {
  /// The key to store if user has already registered.
  static let key = "registered"

  /// True if email is already registered.
  static var isRegistered: Bool {
     UserDefaults.standard.bool(forKey: key)
  }
}
