//
//  CNCharacterDetailViewViewModel.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/1/23.
//

import UIKit

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

    // MARK: - Layouts

    public func createPhotoSectionLayout() -> NSCollectionLayoutSection  {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    public func createInformationSectionLayout() -> NSCollectionLayoutSection  {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(150)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    public func createEpisodeSectionLayout() -> NSCollectionLayoutSection  {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .absolute(150)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging // horizontal scroll
        return section
    }
}
