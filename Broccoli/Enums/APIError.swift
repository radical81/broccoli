/// Captures various errors when sending or requesting data.
enum APIError: ErrorWithMessage {
  /// Malformed URL
  case malformed(String)
  /// Network error or invalid endpoint.
  case network(String)
  /// Bad request
  case badRequest(String)
  /// Retrieve the error messages
  var message: String {
    switch self {
    case .malformed(let message):
      return message
    case .network(let message):
      return message
    case .badRequest(let message):
      return message
    }
  }
}
