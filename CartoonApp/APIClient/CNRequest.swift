//
//  CNRequest.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 6/18/23.
//

import Foundation

/// Object that represents a single API call
final class CNRequest {
    // base url
    // endpoint
    // path component
    // query params
    // 
    // https://rickandmortyapi.com/api/character/2

    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }

    private let endpoint: CNEndpoint

    private let pathComponents: [String]

    private let queryParams: [URLQueryItem]

    /// Constructed url for the API request in String format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue

        if !pathComponents.isEmpty {
            pathComponents.forEach ({
                string += "/\($0)"
            })
        }

        if !queryParams.isEmpty {
            string += "?"
            // name=value&name=value
            let argumentString = queryParams.compactMap({
                guard let value = $0.value else {
                    return nil
                }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }

        return string
    }

    public var url: URL? {
        return URL(string: urlString)
    }

    // MARK: - Public methods

    public init(endpoint: CNEndpoint, pathComponents: [String] = [], queryParams: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParams = queryParams
    }
}
