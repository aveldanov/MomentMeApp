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
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
