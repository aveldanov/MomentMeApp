//
//  RegistrationController.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/11/22.
//

import UIKit


class RegistrationController: UIViewController{
    
    // MARK: - Properties
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo") , for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let emailTextField: UITextField = {
        let textField = CustomAuthTextField(placeholder: "Email")
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = CustomAuthTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let fullNameTextField: UITextField = CustomAuthTextField(placeholder: "Fullname")
    
    private let userNameTextField: UITextField = CustomAuthTextField(placeholder: "Username")
    
    private let signupButton: UIButton = {
        let button = CustomAuthButton(placeholder: "Sign Up", buttonType: .system)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    }
    
}
