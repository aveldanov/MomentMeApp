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
    public var shouldShowMoreIndicator: Bool {
        return false
    }
    private var cellViewModels: [CNCharacterCollectionViewCellViewModel] = []

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

    /// Fetch initial set of characters
    func fetchCharacters() {
        CNService.shared.execute(CNRequest.listCharactersRequest, expecting: CNGetAllCharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let resultModel):
                let results = resultModel.results
                self?.characters = results
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
            fatalError("Unsupported Cell")
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
}

// MARK: - Scroll View

extension CNCharacterListViewViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowMoreIndicator else {
            return
        }

        
    }
}

