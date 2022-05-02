//
//  UserCell.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 4/10/22.
//

import UIKit

class UserCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "UserCell"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.image = #imageLiteral(resourceName: "venom-7")
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Venom"
        return label
    }()
    
    private let fullnameNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Eddie"
        label.textColor = .lightGray
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImageView)
        profileImageView.setDimensions(height: 60, width: 60)
        profileImageView.layer.cornerRadius = 60/2
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
