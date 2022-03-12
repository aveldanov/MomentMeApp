//
//  LoginController.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/11/22.
//

import UIKit


class LoginController: UIViewController{
    
    // MARK: - Properties
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        
        view.backgroundColor = .white
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        
    }

}
