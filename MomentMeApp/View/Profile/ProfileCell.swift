//
//  ProfileCell.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/26/22.
//

import UIKit

class ProfileCell: UICollectionViewCell{
    
    // MARK: - Properties
    
    // MARK: - :Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
