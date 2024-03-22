//
//  CharacterListVM+ScrollView.swift
//  RickAndMortyApp
//
//  Created by Emir Nasyrov on 20.03.2024.
//

import Foundation
import UIKit

// MARK: - ScrollView

extension CharactersListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard viewModel.shouldShowLoadMoreIndicator,
              !viewModel.isLoadingMoreCharacters,
              !viewModel.cellViewModels.isEmpty,
              let nextUrlString = viewModel.apiInfo?.next,
              let url = URL(string: nextUrlString) else {
            return
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) {   [weak self] t in
            let offset = scrollView.contentOffset.y
            let totalContentHeight = scrollView.contentSize.height
            let totalScrollViewFixedHeight = scrollView.frame.size.height
            
            
            
            if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
                self?.viewModel.fetchAdditionalCharacters(url: url)
            }
            t.invalidate()
            
            
            
        }
    }
}
