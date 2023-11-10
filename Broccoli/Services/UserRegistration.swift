import Foundation

/// Implements the registration protocol and calls the API.
struct UserRegistration: Registration {
  /// Register the user.
  func register(_ person: Person) async -> Loadable<Response> {
    guard let url = URL(string: "https://us-central1-blinkapp-684c1.cloudfunctions.net/fakeAuth") else {
      return .failed(APIError.malformed("Invalid URL format."))
    }
    let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    let decoder = JSONDecoder()
    var dataResponse: (Data, URLResponse)?
    do {
      dataResponse = try await URLSession.shared.data(for: request)
    } catch {
      return .failed(APIError.network("Network error or invalid endpoint."))
    }
    guard let response = dataResponse?.1 as? HTTPURLResponse else {
      return .failed(APIError.network("No response from the API."))
    }
    guard let data = dataResponse?.0 else {
      return .failed(APIError.network("Missing data from the API."))
    }
    if response.statusCode == 400 { // Bad request
      guard let responseDetails = try? decoder.decode(Response.self, from: data), let errorMessage = responseDetails.errorMessage else {
        return .failed(APIError.badRequest("Bad request, the service cannot handle this."))
      }
      return .failed(APIError.badRequest(errorMessage))
    }
    guard let responseDetails = try? decoder.decode(Response.self, from: data), responseDetails.registered, response.statusCode == 200 else {
      return .failed(APIError.registrationFail)
    }
    return .loaded(responseDetails)
  }
}
