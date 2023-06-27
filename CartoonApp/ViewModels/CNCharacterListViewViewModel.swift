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
                print("Total: " + model.info.pages.description)
                print("Page result count: " + model.results.count.description)

            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension CNCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // UICollectionViewDataSource methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemPink
        return cell
    }

// UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.bounds.width - 30) / 2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
}

