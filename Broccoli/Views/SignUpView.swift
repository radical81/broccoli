import SwiftUI

/// This view displays the request for invite form.
struct SignUpView: View {
  // MARK: - Properties
  let registrar: Registration?

  // MARK: - State variables
  @State var name: String = ""
  @State var email: String = ""
  @State var confirmEmail: String = ""
  @State var showErrors: Bool = false
  @State var dataForLoading: Loadable<Response> = .notLoaded
  
  // MARK: - Computed Properties
  var validator: RequestInviteValidator {
    RequestInviteValidator(name: name, email: email, confirmEmail: confirmEmail)
  }
  
  // MARK: - View
  var body: some View {
    VStack {
      errors
        .hideIf(!showErrors)
      form
      sendButton
    }
  }
  
  /// Display errors if any, after submitting the form.
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
      switch dataForLoading {
      case .failed(let error):
        if let apiError = error as? APIError {
          Text(apiError.message)
            .font(.callout)
            .foregroundColor(.red)
        }
      default:
        EmptyView()
      }
    }
  }

  /// Name
  var nameField: some View {
    HStack {
      Label("", systemImage: "person")
        .accessibilityIdentifier("nameTextFieldLabel")
      Spacer()
      TextField("Full Name", text: $name)
        .accessibilityIdentifier("nameTextField")
    }
  }
  
  /// Email
  var emailField: some View {
    HStack {
      Label("", systemImage: "envelope")
        .accessibilityIdentifier("emailTextFieldLabel")
      Spacer()
      TextField("Email", text: $email)
        .accessibilityIdentifier("emailTextField")
    }
  }

  /// Confirm email, must match.
  var confirmEmailField: some View {
    HStack {
      Label("", systemImage: "envelope")
        .accessibilityIdentifier("confirmEmailTextFieldLabel")
      Spacer()
      TextField("Confirm Email", text: $confirmEmail)
        .accessibilityIdentifier("confirmEmailTextField")
    }
  }
  
  /// The enclosing form.
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
  
  /// Send button to send the data to the backend.
  var sendButton: some View {
    Button(action: {
      Task {
        await sendFormRequest()
      }
    }) {
      sendStatus
    }
    .buttonStyle(.borderedProminent)
    .tint(.darkGreen)
    .accessibilityIdentifier("sendButton")
  }
  
  /// Display status of sending the form.
  @ViewBuilder
  var sendStatus: some View {
    switch dataForLoading {
    case .notLoaded:
      Text("Send")
    case .loading:
      Text("Sending...")
        .font(.callout)
        .foregroundColor(.white)
    default:
      Text("Send")
    }
  }
  
  
  // MARK: - Methods
  /// Send the form by calling the API.
  func sendFormRequest() async {
    showErrors = true
    if validator.isValidRequestAnInvite {
      dataForLoading = .loading
      if let registrar = registrar {
        dataForLoading = await registrar.register(Person(name: name, email: email))
      }
    }
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView(registrar: nil)
  }
}
