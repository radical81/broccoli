import SwiftUI

/// Convenience methods for View.
extension View {
  /// Hide view if the condition is true.
  @ViewBuilder func hideIf(_ condition: Bool) -> some View{
    if condition {
      EmptyView()
    } else {
      self
    }
  }
}
