//
//  ContentView.swift
//  BookSearchApp
//
//  Created by AoiKobayashi on 2025/05/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LibraryView().tabItem { Label(
                title: { Text("Library") },
                icon: { Image(systemName: "book.fill")}
            ) }
            
            SearchView().tabItem { Label(
                title: { Text("Search") },
                icon: { Image(systemName: "magnifyingglass")}
            )}
        }
    }
}

#Preview {
    ContentView()
}
