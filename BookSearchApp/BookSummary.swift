//
//  BookSummary.swift
//  BookSearchApp
//
//  Created by AoiKobayashi on 2025/05/17.
//

import Foundation
import SwiftData

@Model
final class BookSummary {
    @Attribute(.unique) var id: String
    var title: String
    var thumbnail: String?
    
    init(id: String, title: String, thumbnail: String? = nil) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
    }
}
