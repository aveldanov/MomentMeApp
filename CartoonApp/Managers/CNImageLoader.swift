//
//  CNImageLoader.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/3/23.
//

import Foundation

final class CNImageLoader {
    
    static let shared = CNImageLoader()

    private var imageDataCache = NSCache<NSString, NSData>()

    private init() {

    }

    /// Get Image content with URL
    /// - Parameters:
    ///   - url: source url
    ///   - completion: callback
    func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let data = imageDataCache.object(forKey: key) {
//            print("[CNImageLoader] Reading from cache: \(key)")
            completion(.success(data as Data))
            return
        }

        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            let value = data as NSData

            self?.imageDataCache.setObject(value, forKey: key)
            completion(.success(data))
        }
        task.resume()
    }
}
