import SwiftUI

/// This view represents the home screen.
struct HomeScreen: View {
  @State var presentInvite: Bool = false
  @State var presentCancelConfirm: Bool = false
  @State var presentCancelSuccess: Bool = false
  @State var refresh: Bool = false

  // MARK: - Views
  @ViewBuilder
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
    .sheet(isPresented: $presentInvite, onDismiss: {
      refresh.toggle()
    }) {
      RegisterScreen(registrar: UserRegistration())
    }
    .sheet(isPresented: $presentCancelSuccess, onDismiss: { refresh.toggle() }) {
      CancelScreenSuccess()
    }
    .confirmationDialog(
      "Are you sure you want to cancel the invite?",
      isPresented: $presentCancelConfirm
    ) {
      Button("Yes") {
        cancelInvite()
        presentCancelSuccess.toggle()
      }
    }
  }
  
  /// True if the user is registered.
  var isRegistered: Bool {
    LocalStore.isRegistered
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
      presentCancelConfirm.toggle()
    }
    .buttonStyle(.borderedProminent)
    .tint(.red)
    .accessibilityIdentifier("cancelInviteButton")
  }
  
  // MARK: - Methods
  func cancelInvite() {
    LocalStore.cancel()
  }
}

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
  }
}
