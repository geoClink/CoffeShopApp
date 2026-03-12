CoffeeShopApp
===============

Overview
--------
CoffeeShopApp is a SwiftUI-based iOS app that showcases a cafe menu with drinks and pastries, allows users to browse items, customize drinks (size, milk, extras), add items to a cart, and place orders. It is designed as a sample/shopfront app for learning SwiftUI layout patterns and simple state management.

Key features
------------
- Browse drinks and pastries with images and descriptions
- Customize drink sizes, milk options and extras
- Add items to a cart and view order summary
- Simple order confirmation UI with visual feedback (confetti)
- Search and filter popular items

Repository structure
--------------------
- `CoffeShopApp/` – main app source files
  - `Assets.xcassets/` – images and app icons
  - `CartManager.swift` – cart state management
  - `Coffee.swift`, `Items.swift`, `Pastry.swift` – data models
  - `*TileView.swift` – item tiles used in lists
  - `*CustomizationView.swift` – item customization flows
  - `*ConfirmationView.swift` – order confirmation UIs
  - `ContentView.swift`, `MainScreen.swift` – top-level app screens

Requirements
------------
- Xcode 14 or later (project created with SwiftUI)
- iOS 16.0+ deployment target (verify in Xcode project settings)

Build & run
-----------
Open the Xcode workspace or project, select a simulator or a connected device, then build and run (Cmd+R).

1. Open project:

```bash
open CoffeShopApp/CoffeShopApp.xcodeproj
```

2. Build and run in Xcode: choose a simulator (e.g., iPhone 14) and press Cmd+R.

Notes
-----
- The app uses local assets in `Assets.xcassets`; ensure the asset catalog is present in the project in Xcode.
- No external dependencies are required.

Contact
-------
For questions about this project, open an issue or contact the repository owner.
