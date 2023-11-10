import SwiftUI

struct CancelScreenSuccess: View {
  // MARK: - View
  var body: some View {
    Text("Cancellation successful!")
      .font(.title)
      .foregroundColor(.darkGreen)
  }
}

struct CancelScreenSuccess_Previews: PreviewProvider {
  static var previews: some View {
    CancelScreenSuccess()
  }
}
