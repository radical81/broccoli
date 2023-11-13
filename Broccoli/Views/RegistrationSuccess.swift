import SwiftUI
import ConfettiSwiftUI

/// Registration successful congratulations screen.
struct RegistrationSuccess: View {
  @State private var confettiCounter = 0
  
  // MARK: - View
  var body: some View {
    Text("Registration successful!")
      .font(.title)
      .foregroundColor(.darkGreen)
      .confettiCannon(counter: $confettiCounter)
      .onAppear {
        confettiCounter += 1
      }
  }
}

struct RegistrationSuccess_Previews: PreviewProvider {
  static var previews: some View {
    RegistrationSuccess()
  }
}
