//
//  CNCharacterInformationCollectionViewCell.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/4/23.
//

import UIKit

class CNCharacterInformationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CNCharacterInformationCollectionViewCell"

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Earth"
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        return label
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "globe.americas")
        return imageView
    }()

    private let titleContainerView: UIView = {
        let view = UIView()
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tertiarySystemBackground
        titleContainerView.backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8
        setupViewHierarchy()
        setupViewLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
//        valueLabel.text = nil
//        titleLabel.text = nil
//        iconImageView.image = nil
    }

    private func setupViewHierarchy() {
        contentView.addSubviews(titleContainerView, valueLabel, iconImageView)
        titleContainerView.addSubview(titleLabel)
    }

    private func setupViewLayout() {
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleContainerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.33)
        ])
    }

    public func configure(with: CNCharacterInformationCollectionViewViewModel) {

    }
}
