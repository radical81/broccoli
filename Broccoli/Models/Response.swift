import Foundation

/// Model to capture the responses from the API.
struct Response {
  /// True if the request to register is successful.
  var registered: Bool
  /// Capture any error messages.
  var errorMessage: String?
}
