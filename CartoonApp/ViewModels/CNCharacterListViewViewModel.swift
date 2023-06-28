//
//  CNCharacterListViewViewModel.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 6/25/23.
//

import UIKit


final class CNCharacterListViewViewModel: NSObject {

    func fetchCharacters() {
        CNService.shared.execute(CNRequest.listCharactersRequest, expecting: CNGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Example Image Url "+String(model.results.first?.image ?? "No Image") )

            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension CNCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - UICollectionViewDataSource methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CNCharacterCollectionViewCell.identifier, for: indexPath) as? CNCharacterCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        let viewModel = CNCharacterCollectionViewCellViewModel(
            characterName: "Anton",
            characterStatus: .alive,
            characterImageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.bounds.width - 30) / 2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
}

