//
//  ImagemUsuario.swift
//  Social
//
//  Created by Rubens Ferreira Ramos on 12/04/21.
//

import Foundation

struct ImagemUsuario: Codable, Identifiable {
    let url,thumbnailURL: String
    let albumId, id: Int
    let titulo: String

    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id, titulo, url
        case thumbnailURL = "thumbnailUrl"
    }
}
