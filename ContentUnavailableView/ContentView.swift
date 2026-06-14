//
        //
    //  Project: ContentUnavailableView
    //  File: ContentView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

/// ContentView
///
/// Demonstrates the core `ContentUnavailableView` API with:
/// - A custom leading content area (image + text)
/// - A descriptive message
/// - An optional action button
///
/// Use this pattern whenever your screen has nothing meaningful to show yet
/// (e.g., first launch, no permissions, or a filtered list with no results).
struct ContentView: View {
    var body: some View {
      
        // ContentUnavailableView is a friendly, consistent way to present empty states.
        // You provide three regions: content, description, and actions.
        ContentUnavailableView {
            // The content closure defines the main visual. It can be any SwiftUI view.
            VStack{
                Image(systemName: "sparkles")
                    .font(.system(size: 60)) // Make the icon prominent.
                    .foregroundStyle(.yellow) // Apply a fun accent color.
                
                Text("Welcome to the club!") // A succinct title for the empty state.
            }
        } description: {
            // The description offers more context or guidance.
            Text("You're now in the NDC coding club!")
        } actions: {
            // Optional actions help users move forward.
            Button("Get Started") {}
                .buttonStyle(.bordered) // Use a clear but not overwhelming style here.
        }
        
        // Tips:
        // - Keep the message short and actionable.
        // - Provide at least one clear action if there is a next step.
        // - Use system images and styles for a platform-consistent look.
    }
}

#Preview {
    ContentView()
}
