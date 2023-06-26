//
//  CNCharacterListViewViewModel.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 6/25/23.
//

import Foundation


struct CNCharacterListViewViewModel {

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

