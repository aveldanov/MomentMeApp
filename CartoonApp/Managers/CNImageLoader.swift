//
//  CNImageLoader.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/3/23.
//

import Foundation

final class CNImageLoader {
    static let shared = CNImageLoader()

    private init() {

    }

    func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }

            completion(.success(data))
        }

        task.resume()
    }



}
