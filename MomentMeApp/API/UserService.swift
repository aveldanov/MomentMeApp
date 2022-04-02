//
//  UserService.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 4/2/22.
//

import Firebase


struct UserService{
    static func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            print("[UserService] \(snapshot?.data())")
        }
        
    }
    
}
