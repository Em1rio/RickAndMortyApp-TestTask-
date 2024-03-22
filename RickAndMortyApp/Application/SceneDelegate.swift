//
//  SceneDelegate.swift
//  RickAndMortyApp
//
//  Created by Emir Nasyrov on 20.03.2024.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewModel = CharacterListViewViewModel()
        let vc = CharactersListViewController(viewModel)
        let navController = UINavigationController(rootViewController: vc)
        vc.navController = navController
        navController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
    }

    

}

