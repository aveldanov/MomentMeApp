//
//  CNCharacterInformationCollectionViewCell.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/4/23.
//

import UIKit

class CNCharacterInformationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CNCharacterInformationCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tertiarySystemBackground
        layer.cornerRadius = 8
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    private func setupViewHierarchy() {

    }

    private func setupViewLayout() {

    }

    public func configure(with: CNCharacterInformationCollectionViewViewModel) {

    }
}
