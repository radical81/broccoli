import SwiftUI
import ConfettiSwiftUI

/// Registration successful congratulations screen.
struct RegistrationSuccess: View {
  @State private var confettiCounter = 0
  @State private var users: Loadable<[User]> = .notLoaded
  @State private var searchText = ""
  let registrar: Registration?
  
  // MARK: - View
  var body: some View {
    VStack {
      Text("Searching for \(searchText)")
      Text("Registration successful!")
        .font(.title)
        .foregroundColor(.darkGreen)
        .confettiCannon(counter: $confettiCounter)
        .onAppear {
          confettiCounter += 1
          Task {
            await displayRegisteredUsers()
          }
        }
      userList
    }
  }
  
  @ViewBuilder
  var userList: some View {
    switch users {
    case .loaded(let userList):
      let filteredUsers = userList.filter {$0.name == searchText}
      NavigationView {
        List(filteredUsers) {
          Text($0.name)
        }
      }
      .searchable(text: $searchText)
    default: EmptyView()
    }
  }
  
  // MARK: - Methods
  func displayRegisteredUsers() async {
    if let userRetrieved = await registrar?.registeredUsers() {
      users = userRetrieved
    }
//    print(users)
  }
}

struct RegistrationSuccess_Previews: PreviewProvider {
  static var previews: some View {
    RegistrationSuccess(registrar: nil)
  }
}
