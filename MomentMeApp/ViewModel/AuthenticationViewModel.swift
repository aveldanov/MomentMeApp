//
//  AuthenticationViewModel.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/19/22.
//

import Foundation


struct LoginViewModel{
    let email: String?
    let password: String?
    
    var formIsValid: Bool{
        return email?.isEmpty == false && password?.isEmpty == false
    }
}



struct RegistrationViewModel{
    
    
    
}
