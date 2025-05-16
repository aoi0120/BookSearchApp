//
//  BookThumbnailView.swift
//  BookSearchApp
//
//  Created by AoiKobayashi on 2025/05/17.
//

import SwiftUI

struct BookThumbnailView: View {
    let book: BookSummary
    
    var body: some View {
        ZStack {
            if let thumbnailUrlString = book.thumbnail, let thumbnailUrl = URL(string: thumbnailUrlString) {
                AsyncImage(url: thumbnailUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color.black.opacity(0.15), radius: 8,x:0, y:4)
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .background(Color(UIColor.systemBackground))
    }
}

#Preview {
    BookThumbnailView(book: BookSummary(id: "", title: "Swiftの全て", thumbnail: "https://books.google.com/books/content?id=85ZKBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"))
}
