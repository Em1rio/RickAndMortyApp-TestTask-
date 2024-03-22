//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Emir Nasyrov on 21.03.2024.
//

import Foundation


final class CharacterDetailViewModel {
    private let characterData: Character?
    // MARK: - Init
    init (with characterData: Character) {
        self.characterData = characterData
    }
    
    public func prepareData() -> CharacterDetail {
        guard let characterData = characterData else {
            fatalError("Character data is missing")
        }
        let gender = "Gender: \(characterData.gender.rawValue)"
        let name = "Name: \(characterData.name)"
        let status = "Status: \(characterData.status.text)"
        let origin = "Last seen: \(characterData.origin.name)"
        let species = "Species: \(characterData.species)"
        let characterDetail = CharacterDetail(name: name,
                                              status: status,
                                              gender: gender,
                                              origin: origin,
                                              species: species)
        
        return characterDetail
    }
    
    public func fetchImage(_ url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        ImageLoader.shared.downloadImage(url, completion: completion)
    }
}
