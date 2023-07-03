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
    // https://rickandmortyapi.com/api/character/2

    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }

    /// Desired endpoint
    private let endpoint: CNEndpoint

    /// Path components for API if any
    private let pathComponents: [String]

    /// Arguments for API if any
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

    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }

    /// Desired HTTP method
    public let httpMethod = "GET"

    // MARK: - Public methods

    /// Construct request
    /// - Parameters:
    ///   - endpoint: target end poiint
    ///   - pathComponents: collection of path components
    ///   - queryParams: collection of query parameters
    public init(endpoint: CNEndpoint, pathComponents: [String] = [], queryParams: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParams = queryParams
    }

    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0]
                if let cnEndpoint = CNEndpoint(rawValue: endpointString) {
                    self.init(endpoint: cnEndpoint)
                    return
                }
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty {
                let endpointString = components[0]
                if let cnEndpoint = CNEndpoint(rawValue: endpointString) {
                    self.init(endpoint: cnEndpoint)
                    return
                }
            }
        }

        return nil
    }
}


extension CNRequest {
    static let listCharactersRequest = CNRequest(endpoint: .character)
}
