//
//  CNCharacterPhotoCollectionViewViewModel.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/4/23.
//

import Foundation


final class CNCharacterPhotoCollectionViewViewModel {

    private let imageUrl: URL?
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }

    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageUrl = imageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        CNImageLoader.shared.downloadImage(imageUrl, completion: completion)
    }
}
