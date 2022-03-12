//
//  LoginController.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/11/22.
//

import UIKit


class LoginController: UIViewController{
    
    // MARK: - Properties
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "MomentMe"))
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.keyboardType = .emailAddress
        textField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textField.setHeight(50)
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.keyboardType = .emailAddress
        textField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textField.setHeight(50)
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        textField.isSecureTextEntry = true
        return textField
    }()
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    
    func configureUI(){
        
        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle = .black
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemTeal.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
}
