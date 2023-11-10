import SwiftUI

/// Registration successful congratulations screen.
struct RegistrationSuccess: View {
  
  // MARK: - View
  var body: some View {
    Text("Registration successful!")
      .font(.title)
      .foregroundColor(.darkGreen)
  }
}

struct RegistrationSuccess_Previews: PreviewProvider {
  static var previews: some View {
    RegistrationSuccess()
  }
}
