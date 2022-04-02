//
//  ProfileCell.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/26/22.
//

import UIKit

class ProfileCell: UICollectionViewCell{
    
    // MARK: - Properties
    static let identifier = "ProfileCell"
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "venom-7")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - :Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(postImageView)
        postImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
