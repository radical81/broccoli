import SwiftUI

struct SignUpView: View {
  @State var name: String = ""
  @State var email: String = ""
  
  var body: some View {
    VStack {
      form
    }
    Button("Submit") {
      
    }
  }
  
  var nameField: some View {
    HStack {
      Label("", systemImage: "person")
      Spacer()
      TextField("Name", text: $name)
    }
  }
  
  var emailField: some View {
    HStack {
      Label("", systemImage: "envelope")
      Spacer()
      TextField("Email address", text: $email)
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
