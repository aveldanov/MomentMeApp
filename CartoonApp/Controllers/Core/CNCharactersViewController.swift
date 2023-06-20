//
//  CNCharacterViewController.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 6/11/23.
//

import UIKit

final class CNCharactersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"


        let request = CNRequest(endpoint: .character, queryParams: [URLQueryItem(name: "name", value: "Rick"), URLQueryItem(name: "status", value: "alive")])
        print(request.url)
        print(request.url?.pathComponents)
        print(request.url?.baseURL)

        CNService.shared.execute(request, expecting: Int.self) { result in
            switch result {
            case .success(<#T##Int#>)
            }
        }

    }

}
