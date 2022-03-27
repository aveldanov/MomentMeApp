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
    
    static func registerUser(withCredentials credentials: AuthCredentials, completion: @escaping (Error?)->Void){
        
        ImageUploader.uploadImage(image: credentials.profileImage) { imageURLString in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { authResult, error in
                if let error = error {
                    print("[AuthService] Error \(error.localizedDescription)")
                    return
                }
                
                guard let uid = authResult?.user.uid else {
                    return
                }
                
                let data: [String: Any] = ["email": credentials.email,
                                            "fullname": credentials.fullname,
                                            "profileImageURL": imageURLString,
                                            "uid": uid,
                                            "username": credentials.username]
                
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
            }
        }
    }
    
    
    static func loginUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?){
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
        
    }
}
