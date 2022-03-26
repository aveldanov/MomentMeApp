//
//  AuthService.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/25/22.
//

import UIKit
import Firebase

struct AuthCredentials{
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
    
}



struct AuthService{
    
    static func registerUser(withCredentials credentials: AuthCredentials){
        
        print(credentials)
        
    }
    
    
    
}
