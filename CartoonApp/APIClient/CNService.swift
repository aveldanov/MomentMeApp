//
//  CNService.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 6/18/23.
//

import Foundation

/// Primary API Service object to get data
final class CNService {
    /// Shared singleton instance
    static let shared = CNService()

    /// Privitized Contructor
    private init() {}

    /// Send API call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - completion: Callback with data for error
    public func execute(_ request: CNRequest, completion: @escaping (Result<String, Error>) -> Void) {

    }
}
