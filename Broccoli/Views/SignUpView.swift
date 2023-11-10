import SwiftUI

struct SignUpView: View {
  @State var name: String = ""
  @State var email: String = ""
  @State var confirmEmail: String = ""
  
  var body: some View {
    VStack {
      form
      sendButton
    }
  }
  
  var nameField: some View {
    HStack {
      Label("", systemImage: "person")
        .accessibilityIdentifier("nameTextFieldLabel")
      Spacer()
      TextField("Full Name", text: $name)
        .accessibilityIdentifier("nameTextField")
    }
  }
  
  var emailField: some View {
    HStack {
      Label("", systemImage: "envelope")
        .accessibilityIdentifier("emailTextFieldLabel")
      Spacer()
      TextField("Email", text: $email)
        .accessibilityIdentifier("emailTextField")
    }
  }

  var confirmEmailField: some View {
    HStack {
      Label("", systemImage: "envelope")
        .accessibilityIdentifier("confirmEmailTextFieldLabel")
      Spacer()
      TextField("Confirm Email", text: $confirmEmail)
        .accessibilityIdentifier("confirmEmailTextField")
    }
  }
  
  var form: some View {
    VStack(alignment: .leading) {
      Text("Request an invite")
        .font(.headline)
      nameField
      emailField
      confirmEmailField
    }
    .padding()
    .frame(maxWidth: 300)
    .background(
      RoundedRectangle(cornerRadius: 20)
        .fill(.easyGreen)
    )
  }
  
  var sendButton: some View {
    Button("Send") {
      
    }
    .buttonStyle(.borderedProminent)
    .tint(.darkGreen)
    .accessibilityIdentifier("sendButton")
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
  }
}
