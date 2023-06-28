//
//  CNCharacterCollectionViewCell.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 6/26/23.
//

import UIKit

/// Single cell for a charachter
class CNCharacterCollectionViewCell: UICollectionViewCell {

    static let identifier = "CNCharacterCollectionViewCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViewHierarchy() {


    }


    private func setupViewLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

    }


    override func prepareForReuse() {
        super.prepareForReuse()
    }

    public func configure(with viewModel: CNCharacterCollectionViewCellViewModel) {

    }
    
}
