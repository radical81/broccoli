import Foundation

/// Model to capture the responses from the API.
struct Response: Decodable {
  /// True if the request to register is successful.
  var registered: Bool
  /// Capture any error messages.
  var errorMessage: String?
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    errorMessage = try values.decode(String.self, forKey: .errorMessage)
    registered = errorMessage == nil
  }
  
  enum CodingKeys: String, CodingKey {
    case errorMessage
  }
}
