import SwiftUI

struct SignUpView: View {
  @State var name: String = ""
  @State var email: String = ""
  @State var confirmEmail: String = ""
  @State var showErrors: Bool = false
  
  var validator: RequestInviteValidator {
    RequestInviteValidator(name: name, email: email, confirmEmail: confirmEmail)
  }
  var body: some View {
    VStack {
      errors
        .hideIf(!showErrors)
      form
      sendButton
    }
  }
  
  
  var errors: some View {
    VStack {
      if !validator.isValidName {
        Text("The name is too short.")
          .font(.callout)
          .foregroundColor(.red)
      }
      if !validator.isValidEmailAddress {
        Text("Email address is not valid.")
          .font(.callout)
          .foregroundColor(.red)
      }
      if !validator.isValidConfirmEmailAddress {
        Text("Confirm email address is not valid.")
          .font(.callout)
          .foregroundColor(.red)
      }
      if !validator.emailAddressesMatch {
        Text("Email addresses don't match.")
          .font(.callout)
          .foregroundColor(.red)
      }
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
      sendFormRequest()
    }
    .buttonStyle(.borderedProminent)
    .tint(.darkGreen)
    .accessibilityIdentifier("sendButton")
  }
  
  func sendFormRequest() {
    showErrors = true
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
  }
}
