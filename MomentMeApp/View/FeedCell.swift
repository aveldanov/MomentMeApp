//
//  FeedCell.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/6/22.
//

import UIKit


class FeedCell: UICollectionViewCell{
    
    // MARK: - Properties
    static let identifier = "FeedCell"
    
    private let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .systemPurple
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(profileImageView)
        profileImageView.anchor(top:topAnchor,
                                left: leftAnchor,
                                paddingTop: 12,
                                paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
