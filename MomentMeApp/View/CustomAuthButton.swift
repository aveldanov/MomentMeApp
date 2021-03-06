//
//  CustomAuthButton.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/19/22.
//

import Foundation
import UIKit


class CustomAuthButton: UIButton{
    
    init(placeholder: String, buttonType: UIButton.ButtonType){
        super.init(frame: .zero)
        setTitle(placeholder, for: .normal)
        setTitleColor(UIColor(white: 1, alpha: 0.67), for: .normal)
        
        backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).withAlphaComponent(0.5)
        layer.cornerRadius = 5
        setHeight(50)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
