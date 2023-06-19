//
//  CNCharacter.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 6/11/23.
//

import Foundation

struct CNCharacter: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: CNOrigin
    let location: CNOrigin
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
