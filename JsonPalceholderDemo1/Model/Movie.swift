//
//  Movie.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 24/06/2021.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let userId, id: Int
    let title, body: String
//
//    enum CodingKeys: String, CodingKey {
//        case userId// = "userId"
//        case id, title, body
//    }
}
