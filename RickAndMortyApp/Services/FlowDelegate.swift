//
//  NavigationDelegate.swift
//  RickAndMortyApp
//
//  Created by Emir Nasyrov on 20.03.2024.
//

import Foundation
/// Manages navigation, pagination and loading setting
protocol FlowDelegate: AnyObject {
    ///Opens a new screen and transfers data there
    func goToNextScreen(_ character: Character)
    /// Configures the display of collectionView after loading data
    func didLoadInitialCharacters()
    /// Gives a signal to the collectionView 
    func didLoadMoreCharacters(with newIndexPaths: [IndexPath])
    
}
