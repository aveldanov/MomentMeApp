//
//  CNCharacterDetailViewViewModel.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/1/23.
//

import Foundation

final class CNCharacterDetailViewViewModel {
    private let character: CNCharacter

    enum SectionType: CaseIterable {
        case photo
        case information
        case episodes
    }

    public let sections = SectionType.allCases

    // MARK: - Initilizer

    init(character: CNCharacter) {
        self.character = character
    }

    private var requestUrl: URL? {
        return URL(string: character.url)
    }

    public var title: String {
        character.name.uppercased()
    }
}
