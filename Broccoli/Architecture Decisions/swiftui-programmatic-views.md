#  SwiftUI for Programmatic Views
#### 10 November 2023
---

### Status
Initial implementation.

### Context
The initial default way of implementing the view for the entire app.

### Decision
The choice for using SwiftUI after asking permission from Ruth, is to have a robust UI and view hierarchy and to use the latest development tools from Apple.
SwiftUI is very adaptable towards rendering across different devices without having to manually tweak the layout for each one.
SwiftUI simplifies the alternative of programmatically writing UI elements in UIKit and having to programmatically specify layout constraints. 
SwiftUI also offers live previews and as the code is written, changes are rendered straightaway.

### Consequences
This accelerates development time in terms of seeing the changes that are being made in the code live in the preview. Building the app is not necessary for every change in the UI code.

This however makes it less compatible with any existing codebase if that codebase is already extensively written in UIKit.

    


