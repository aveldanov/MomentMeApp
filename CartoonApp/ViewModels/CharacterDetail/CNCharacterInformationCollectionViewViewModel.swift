//
//  CNCharacterInformationCollectionViewViewModel.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/4/23.
//

import UIKit

final class CNCharacterInformationCollectionViewViewModel {

    private let type: `Type`
    private let value: String

    public var title: String {
        type.displayTitle
    }

    public var displayValue: String {
        if value.isEmpty {
            return "None"
        }
        return value
    }

    public var iconImage: UIImage? {
        return type.iconImage
    }

    public var tintColor: UIColor {
        return type.tintColor
    }

    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case location
        case created
        case episodeCount


        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemBlue
            case .gender:
                return .systemPink
            case .type:
                return .systemYellow
            case .species:
                return .systemPurple
            case .origin:
                return .systemCyan
            case .location:
                return .systemMint
            case .created:
                return .systemOrange
            case .episodeCount:
                return .systemBrown
            }
        }

        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "bell")
            case .gender:
                return UIImage(systemName: "bell")
            case .type:
                return UIImage(systemName: "bell")
            case .species:
                return UIImage(systemName: "bell")
            case .origin:
                return UIImage(systemName: "bell")
            case .location:
                return UIImage(systemName: "bell")
            case .created:
                return UIImage(systemName: "bell")
            case .episodeCount:
                return UIImage(systemName: "bell")
            }
        }

        var displayTitle: String {
            switch self {
            case .status,
                    .gender,
                    .type,
                    .species,
                    .origin,
                    .location,
                    .created:
                return rawValue.uppercased()

            case .episodeCount:
                return "EPISODE COUNT"
            }
        }
    }

    init(type: `Type`, value: String) {
        self.value = value
        self.type = type
    }
}
