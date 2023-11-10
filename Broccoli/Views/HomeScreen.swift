import SwiftUI

/// This view represents the home screen.
struct HomeScreen: View {
  @State var presentInvite: Bool = false
  @State var presentCancel: Bool = false

  var body: some View {
    VStack(spacing: 20) {
      Spacer()
      title
      if isRegistered {
        cancelButton
      } else {
        registerButton
      }
      Spacer()
    }
    .sheet(isPresented: $presentInvite) {
      RegisterScreen(registrar: UserRegistration())
    }
  }
  
  /// The main home screen title.
  var title: some View {
    Text("Broccoli & Co.")
      .font(.largeTitle)
      .foregroundColor(.darkGreen)
      .accessibilityIdentifier("mainHeading")
  }
  
  /// The register button to request an invite.
  var registerButton: some View {
    Button("Request an invite") {
      presentInvite.toggle()
    }
    .buttonStyle(.borderedProminent)
    .tint(.darkGreen)
    .accessibilityIdentifier("requestInviteButton")
  }
  
  /// The cancellation button to cancel the invite.
  var cancelButton: some View {
    Button("Cancel the invite") {
      presentCancel.toggle()
    }
    .buttonStyle(.borderedProminent)
    .tint(.red)
    .accessibilityIdentifier("cancelInviteButton")
  }
}

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
  }
}
