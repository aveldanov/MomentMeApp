//
//  CNCharacterListViewViewModel.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 6/25/23.
//

import UIKit

protocol CNCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didSelectCharacter(_ character: CNCharacter)
}

/// View Model to handle charater list logic
final class CNCharacterListViewViewModel: NSObject {

    public weak var delegate: CNCharacterListViewViewModelDelegate?
    private var cellViewModels: [CNCharacterCollectionViewCellViewModel] = []
    private var apiInfo: CNGetAllCharactersResponse.Info? = nil

    private var isLoadingMoreCharacters = false
    private var characters: [CNCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = CNCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageURL: URL(string: character.image))
                cellViewModels.append(viewModel)
            }
        }
    }

    public var shouldShowMoreIndicator: Bool {
        return apiInfo?.next != nil
    }

    /// Fetch initial set of characters
    func fetchCharacters() {
        CNService.shared.execute(CNRequest.listCharactersRequest, expecting: CNGetAllCharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let resultModel):
                self?.characters = resultModel.results
                self?.apiInfo = resultModel.info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
                print("Example Image Url "+String(resultModel.results.first?.image ?? "No Image") )

            case .failure(let error):
                print(String(describing: error))
            }
        }
    }

    /// Paginate when additional characters are needed
    public func fetchAdditionalCharacters() {
        // Fetch characters
        print("[CNCharacterListViewViewModel] Fetch more!!!")
        isLoadingMoreCharacters = true
    }


}

// MARK: - Collection View Methods

extension CNCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - UICollectionViewDataSource methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CNCharacterCollectionViewCell.identifier, for: indexPath) as? CNCharacterCollectionViewCell else {
            fatalError("[CNCharacterListViewViewModel] Unsupported Cell")
        }

        let viewModel = cellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.bounds.width - 30) / 2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }

    // Footer setup
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard kind == UICollectionView.elementKindSectionFooter, let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CNFooterLoadingCollectionReusableView.identifier, for: indexPath) as? CNFooterLoadingCollectionReusableView else {
            fatalError("[CNCharacterListViewViewModel] could not load footer")
        }
        footer.startAnimating()
        return footer
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard shouldShowMoreIndicator else {
            return .zero
        }
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

// MARK: - Scroll View

extension CNCharacterListViewViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowMoreIndicator, !isLoadingMoreCharacters else {
            return
        }
        let offset = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let totalScrollViewFixedHeight = scrollView.frame.size.height

        if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
            fetchAdditionalCharacters()
        }
    }
}

