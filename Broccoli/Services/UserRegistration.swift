import Foundation

/// Implements the registration protocol and calls the API.
struct UserRegistration: Registration {
  func registeredUsers() async -> Loadable<[User]> {
    guard let url = URL(string: "https://us-central1-blnq-nonprod.cloudfunctions.net/fakeUserList") else {
      return .failed(APIError.malformed("Invalid URL format."))
    }
    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
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
//      guard let responseDetails = try? decoder.decode([User].self, from: data) else {
//        return .failed(APIError.badRequest("Bad request, the service cannot handle this."))
//      }
    }
    guard response.statusCode == 200 else {
      return .failed(APIError.registrationFail)
    }
    guard let responseDetails = try? decoder.decode([User].self, from: data) else {
      return .failed(APIError.badRequest("Bad request, the service cannot handle this."))
    }
    return .loaded(responseDetails)
  }
  
  /// Register the user.
  func register(_ person: Person) async -> Loadable<Response> {
    guard let url = URL(string: "https://us-central1-blinkapp-684c1.cloudfunctions.net/fakeAuth") else {
      return .failed(APIError.malformed("Invalid URL format."))
    }
    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "POST"
    var encodedData: Data?
    do {
      encodedData = try JSONEncoder().encode(person)
    } catch {
      return .failed(APIError.missingRequestDetails("Name or email must be missing in the request payload."))
    }
    guard let encodedData = encodedData else {
      return .failed(APIError.missingRequestDetails("Name or email must be missing in the request payload."))
    }
    request.httpBody = encodedData
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
    guard response.statusCode == 200, let stringResponse = String(data: data, encoding: .utf8), stringResponse == "Registered" else {
      return .failed(APIError.registrationFail)
    }
    return .loaded(Response(registered: true))
  }
}
