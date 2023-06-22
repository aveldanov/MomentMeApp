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
