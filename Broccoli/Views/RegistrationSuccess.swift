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
  
  /// Filtered users by search text
  var filteredUsers: [User] {
    guard let userList = users.value else {
      return []
    }
    guard !searchText.isEmpty else {
      return userList
    }
    return userList.filter {$0.name.contains(searchText)}
  }

  @ViewBuilder
  var userList: some View {
    switch users {
    case .loaded(_):
      NavigationView {
        VStack {
          Text("Registered Users:")
            .font(.subheadline)
          List(filteredUsers) {
            Text($0.name)
          }
        }
      }
      .searchable(text: $searchText, prompt: "Filter users by name")
    default:
      EmptyView()
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
