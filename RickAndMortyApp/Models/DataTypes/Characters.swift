//
//  Characters.swift
//  RickAndMortyApp
//
//  Created by Emir Nasyrov on 20.03.2024.
//

import Foundation
struct Character: Codable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: CharacterGender
    let origin: CharacterOrigin
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
