//
//  CNCharacterDetailViewViewModel.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/1/23.
//

import Foundation

final class CNCharacterDetailViewViewModel {
    let character: CNCharacter

    init(character: CNCharacter) {
        self.character = character
    }

    public var title: String {
        character.name.uppercased()
    }
}
