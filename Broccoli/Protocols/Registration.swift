import Foundation

/// Represents the backend API for receiving user registrations and hides its implementation.
protocol Registration {
  /// Register the user.
  func register(_ person: Person) async -> Loadable<Response>
}
