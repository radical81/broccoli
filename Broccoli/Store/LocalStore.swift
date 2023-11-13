import SwiftUI

/// Convenience functions for managing local store.
struct LocalStore {
  /// True if the user is already registered.
   @AppStorage("registered", store: .standard) static var isRegistered: Bool = false
  
  /// Mark the user as registered.
  static func register() {
    isRegistered = true
  }
  
  /// Cancel the registration.
  static func cancel() {
    isRegistered = false
  }
}
