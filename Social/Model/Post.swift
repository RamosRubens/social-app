//
//  Post.swift
//  Social
//
//  Created by Rubens Ferreira Ramos on 12/04/21.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId, id: Int
    let titulo, body: String

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id, titulo, body
    }
}
