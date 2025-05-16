//
//  SearchRowView.swift
//  BookSearchApp
//
//  Created by AoiKobayashi on 2025/05/17.
//

import Foundation
import SwiftUI

struct SearchRowView: View {
    @StateObject private var bookManager = BookManager()
    @State var isSaved: Bool = false
    let item: Item
    
    var body: some View {
        HStack {
            if let thumbnailUrl = item.volumeInfo.imageLinks?.thumbnail {
                let secureUrl = thumbnailUrl.replacingOccurrences(of: "http://", with: "https://")
                AsyncImage(url: URL(string: secureUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }
                .onAppear {
                    print("🔍 Original thumbnail URL: \(thumbnailUrl)")
                    print("🔒 Secure thumbnail URL: \(secureUrl)")
                }
            }
            
            VStack(alignment: .leading) {
                Text(item.volumeInfo.title ?? "")
                    .font(.headline)
                    .bold()
                Text(item.volumeInfo.publisher ?? "")
                    .font(.caption)
            }
            
            Spacer()
            
            Button(action: {
                guard !isSaved else { return }
                bookManager.saveBook(title: item.volumeInfo.title ?? "", thumbnail: item.volumeInfo.imageLinks?.thumbnail)
                isSaved = true
            }, label: {
                Image(systemName: isSaved ? "star.fill" : "star")
            })
            .buttonStyle(PlainButtonStyle())
        }
        .frame(minHeight: 100)
    }
}

#Preview {
    SearchRowView(item: Item(kind: "", id: "@", selfLink: "", volumeInfo: VolumeInfo()))
}
