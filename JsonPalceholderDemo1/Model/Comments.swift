//
//  Comments.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 10/07/2021.
//

import Foundation

struct Comments: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}


