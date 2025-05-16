//
//  BookResponse.swift
//  BookSearchApp
//
//  Created by AoiKobayashi on 2025/05/17.
//

import Foundation

struct BookResponse: Codable {
    var totalItems: Int
    var items: [Item]
}

struct Item: Codable {
    var kind: String
    var id: String
    var selfLink: String
    var volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    var title: String?
    var authors: [String]?
    var description: String?
    var publisher: String?
    var imageLinks: ImageLink?
}


struct ImageLink: Codable {
    var smallThumbnail: String?
    var thumbnail: String?
}
