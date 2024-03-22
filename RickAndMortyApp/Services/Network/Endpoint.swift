//
//  Endpoint.swift
//  RickAndMortyApp
//
//  Created by Emir Nasyrov on 20.03.2024.
//

import Foundation
/// Represents uniq API endpiont
@frozen enum Endpiont: String {
    ///Endpiont to get character info
    case character
    ///Endpoint to get episode info
    case episode
    ///Endpoint to get location info
    case location
}
