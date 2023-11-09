import SwiftUI

struct SignUpView: View {
  @State var name: String = ""
  @State var email: String = ""
  
  var body: some View {
    VStack {
      form
    }
    Button("Send") {
      
    }
    .buttonStyle(.borderedProminent)
    .tint(.darkGreen)
    .accessibilityIdentifier("sendButton")
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

  var form: some View {
    VStack(alignment: .leading) {
      Text("Request an invite")
        .font(.headline)
      nameField
      emailField
    }
    .padding()
    .frame(maxWidth: 300)
    .background(
      RoundedRectangle(cornerRadius: 20)
        .fill(.easyGreen)
    )
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
  }
}
