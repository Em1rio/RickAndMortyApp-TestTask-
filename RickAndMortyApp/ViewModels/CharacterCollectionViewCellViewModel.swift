//
//  CharacterCollectionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Emir Nasyrov on 20.03.2024.
//

import Foundation
final class CharacterCollectionViewCellViewModel: Hashable, Equatable {
    
    
    public let characterName: String
    private let characterGender: CharacterGender
    private let characterImageUrl: URL?
    
    
    // MARK: - Init
    init (
        characterName: String,
        characterGender: CharacterGender,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterGender = characterGender
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterGenderText: String {
        return "Gender: \(characterGender.rawValue)"
    }
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        ImageLoader.shared.downloadImage(url, completion: completion)
    }
    
    //MARK: - Hashable
    
    static func == (lhs: CharacterCollectionViewCellViewModel, rhs: CharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterGender)
        hasher.combine(characterImageUrl)
    }
}
