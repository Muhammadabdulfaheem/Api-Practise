//
//  Netflix.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 30/06/2021.
//

import Foundation

struct Netflix: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
