//
//  SearchView.swift
//  BookSearchApp
//
//  Created by AoiKobayashi on 2025/05/17.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @StateObject private var apiClient = BooksAPIClient()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(apiClient.books?.items ?? [], id: \.id) { item in
                    SearchRowView(item: item)
                }
            }
            .navigationTitle("Search")
            .listStyle(.grouped)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
        .onChange(of: searchText) {
            apiClient.fetchBooks(queryString: searchText)
        }
    }
}

#Preview {
    SearchView()
}
