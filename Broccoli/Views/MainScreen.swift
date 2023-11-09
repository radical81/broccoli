import SwiftUI

struct MainScreen: View {
  @State var presentInvite: Bool = false

  var body: some View {
    VStack(spacing: 20) {
      Spacer()
      Text("Broccoli & Co.")
        .font(.largeTitle)
        .foregroundColor(.darkGreen)
      Button("Request an invite") {
        presentInvite.toggle()
      }
      .buttonStyle(.borderedProminent)
      .tint(.darkGreen)
      Spacer()
    }
    .sheet(isPresented: $presentInvite) {
      SignUpView()
    }
  }
}

struct MainScreen_Previews: PreviewProvider {
  static var previews: some View {
    MainScreen()
  }
}
