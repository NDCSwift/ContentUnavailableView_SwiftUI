//
        //
    //  Project: ContentUnavailableView
    //  File: SearchVariant.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

/// SearchVariant
///
/// A small sample that demonstrates:
/// - Showing a friendly empty state with `ContentUnavailableView` when there are no items
/// - Showing a search-specific empty state using `ContentUnavailableView.search(text:)`
/// - Using `.searchable` to filter a list of strings
/// - Adding items with a toolbar button
///
/// This is a great pattern to follow when your UI can be in multiple empty states
/// (no content vs. no search results). Keeping these states explicit helps users
/// understand what to do next.
struct SearchVariant: View {
    /// The source of truth for our data. In a real app this might be a model loaded
    /// from disk or the network. For learning purposes we keep it simple.
    @State private var items: [String] = []

    /// The current search text bound to `.searchable`. Updating this value
    /// will automatically re-render the view.
    @State private var query = ""
    
    /// Convenience initializer used by previews to seed initial state.
    /// This lets us showcase different UI states (empty, results, no results).
    init(items: [String] = [], query: String = "") {
        _items = State(initialValue: items)
        _query = State(initialValue: query)
    }

    /// A computed view of `items` filtered by `query`.
    /// - Note: `localizedCaseInsensitiveContains` is a user-friendly way to match text
    ///   regardless of case and locale.
    var filtered: [String] {
        query.isEmpty ? items : items.filter { $0.localizedCaseInsensitiveContains(query)}
    }

    var body: some View {
        // Use a NavigationStack to get a title and toolbar area.
        NavigationStack{
            // Group lets us apply modifiers like `.searchable` to multiple branches.
            Group {
                // 1) No items at all: encourage the user to add their first item.
                if items.isEmpty {
                    // ContentUnavailableView is ideal for empty states. You can provide
                    // a main content area (here we use a system `Label`), an optional
                    // description, and optional actions.
                    ContentUnavailableView {
                        Label("No items", systemImage: "tray")
                    } description: {
                      Text("Tap the plus button to add your first item")
                    } actions: {
                        // A primary action that makes it obvious how to proceed.
                        Button("Add item") {
                            addItem()
                        }
                        .buttonStyle(.borderedProminent) // Draws attention to the action.
                    }
                }
                // 2) We have items, but none match the search query.
                else if filtered.isEmpty {
                    // This specialized variant automatically includes search affordances
                    // and communicates that the empty state is due to filtering.
                    ContentUnavailableView.search(text: query)
                }
                // 3) We have results — show the filtered list.
                else {
                    // In production, prefer stable IDs from your data model instead of `.self`.
                    List(filtered, id: \.self) { Text($0) }
                }
            }
            // Attaches a search field to the navigation UI.
            // - Tip: For larger datasets, consider debouncing or searching asynchronously.
            .searchable(text: $query)
            .navigationTitle("Items")
            .toolbar {
                // A single toolbar button that appends a new item.
                Button { addItem()}
                label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    /// Appends a new item to the list. In a real app, you might present a form
    /// or capture user input. Here we auto-increment for simplicity.
    private func addItem() {
        items.append("Item \(items.count + 1)")
    }
}

#Preview("Empty") {
    // No items, no query -> shows the primary empty state with an action to add the first item.
    SearchVariant()
}

#Preview("With Items") {
    // Items exist, no query -> shows the full list.
    SearchVariant(items: ["Item 1", "Item 2", "Another item"]) 
}

#Preview("Search Some Results") {
    // Items exist and the query matches some entries -> shows a filtered list.
    SearchVariant(items: ["Apple", "Banana", "Apricot", "Berry"], query: "ap")
}

#Preview("Search No Results") {
    // Items exist but the query matches none -> shows the search empty state variant.
    SearchVariant(items: ["Apple", "Banana", "Apricot", "Berry"], query: "zzz")
}
