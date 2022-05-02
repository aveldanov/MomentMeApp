//
//  UserService.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 4/2/22.
//

import Firebase
import Darwin


struct UserService{
    static func fetchUser(completion: @escaping (User)->Void){
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else{
                return
            }
            // BAD solution:
//            let email = dictionary["email"] as? String
//
//            let user = User(email: <#T##String#>, fullname: <#T##String#>, profileImageURL: <#T##String#>, username: <#T##String#>, uid: <#T##String#>)

            //GOOD Solution:
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
    
    static func fetchUser(completion: @escaping ([User])->Void){
        COLLECTION_USERS.getDocuments { snapshot, error in
            guard let snapshot = snapshot else {
                return
            }
            
            let users = snapshot.documents.map({User(dictionary: $0.data())})
            completion(users)
        }
    }
    
}
