import SwiftUI

struct MainScreen: View {
  
  var body: some View {
    VStack(spacing: 20) {
      Spacer()
      Text("Broccoli & Co.")
        .font(.largeTitle)
        .foregroundColor(.darkGreen)
      SignUpView()
      Button("Submit") {
        
      }
      .buttonStyle(.borderedProminent)
      .tint(.darkGreen)
      Spacer()
    }
  }
}

struct MainScreen_Previews: PreviewProvider {
  static var previews: some View {
    MainScreen()
  }
}
