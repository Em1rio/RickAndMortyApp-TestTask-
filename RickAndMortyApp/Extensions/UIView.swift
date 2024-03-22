//
//  UIView.swift
//  RickAndMortyApp
//
//  Created by Emir Nasyrov on 21.03.2024.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
