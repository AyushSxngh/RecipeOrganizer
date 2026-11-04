# 🍳 Recipe Organizer

A full-featured iOS recipe management application built with Swift and UIKit adhering strictly to Apple's Model-View-Controller (MVC) architectural pattern.

## ✨ Features

- **Recipe Catalog & Browsing:** Displays saved recipes in an interactive `UITableView` with custom table view cells.
- **Recipe Creation:** Add recipes with details including recipe name, ingredients list, and preparation instructions.
- **Detailed Recipe View:** Dedicated screen inspecting complete ingredients and instructions for each dish.
- **Safe Recipe Deletion:** Delete individual recipes with an alert controller confirmation dialog to prevent accidental removal.
- **Local Persistence:** Encodes and saves data locally via `UserDefaults` with `Codable` and `JSONEncoder`/`JSONDecoder`.
- **System Design Specs:** Complete architecture, design patterns, and workflows documented in [design.md](design.md).

## 🏗️ Architecture

Built using Apple's Model-View-Controller (MVC) architecture:
- **Model:** `Recipe.swift` (`Codable` data structure)
- **View:** `Main.storyboard` layout with Auto Layout constraints, Navigation Controller, and Table Views.
- **Controllers:**
  - `ViewController`: Master recipe listing with table view data source & delegate management.
  - `AddRecipeViewController`: Form capture with text fields and multi-line text views.
  - `RecipeDetailViewController`: Detailed recipe presentation and deletion workflow.

## 🛠️ Tech Stack & Requirements

- **Language:** Swift 5
- **UI Framework:** UIKit
- **Persistence:** UserDefaults (`Codable` / `JSONEncoder`)
- **Target Platform:** iOS 17.0+
- **IDE:** Xcode 15+

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/AyushSxngh/RecipeOrganizer.git
   ```
2. Open `Recipe Organizer.xcodeproj` in Xcode:
   ```bash
   open "Recipe Organizer.xcodeproj"
   ```
3. Select an iOS Simulator and press `Cmd + R` to build and run.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
