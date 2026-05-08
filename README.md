# 🫙 ContentUnavailableView — SwiftUI Empty States
A focused SwiftUI demo showing how to handle every empty-state scenario your app will face.

---

## 🤔 What this is
`ContentUnavailableView` is a native SwiftUI component (iOS 17+) that gives your app a polished, platform-consistent way to communicate when there's nothing to show. This project covers both the custom variant — where you supply your own icon, title, and action — and the built-in search variant that automatically adapts its messaging to the user's current query.

## ✅ Why you'd use it
- **Native polish** — Matches system empty-state styling automatically, so it looks right on every device without extra effort.
- **Search-aware** — `ContentUnavailableView.search(text:)` knows the difference between "no data yet" and "no results for this query," keeping your UI clear and honest.
- **Action-driven** — The optional `actions` closure lets you surface a clear next step (add an item, clear a filter) right inside the empty state.

## 📺 Watch on YouTube
[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/FeNIGjSpaCo)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/NDCSwift/ContentUnavailableView_SwiftUI.git
```

### 2. Open the project
```
ContentUnavailableView.xcodeproj
```

### 3. Set your Team
In Xcode → **Signing & Capabilities**, select your personal or organisation team.

### 4. Update the Bundle ID
Change `com.ndcswift.ContentUnavailableView` to a reverse-domain ID you own, then build and run.

---

## 🛠️ Notes
- `ContentView.swift` — custom empty state with a `sparkles` icon, welcome message, and a "Get Started" button.
- `SearchVariant.swift` — demonstrates all three list states: no items, no search results, and a populated filtered list. Includes multiple `#Preview` macros so you can inspect every state directly in Xcode Previews.

## 📦 Requirements
| | Minimum |
|---|---|
| iOS | 17.0 |
| Xcode | 15.0 |
| Swift | 5.9 |

---

📺 [Watch the guide on YouTube](https://youtu.be/FeNIGjSpaCo)
