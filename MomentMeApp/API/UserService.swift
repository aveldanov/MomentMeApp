//
//  UserService.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 4/2/22.
//

import Firebase


struct UserService{
    static func fetchUser(completion: @escaping (User)->Void){
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else{
                return
            }
            
            
            
            
            
//            let email = dictionary["email"] as? String
//
//
//            let user = User(email: <#T##String#>, fullname: <#T##String#>, profileImageURL: <#T##String#>, username: <#T##String#>, uid: <#T##String#>)

        }
        
    }
    
}
