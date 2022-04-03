//
//  ProfileHeaderViewModel.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 4/3/22.
//

import Foundation

struct ProfileHeaderViewModel{
    
    let user: User
    
    var fullname: String{
        return user.fullname
    }
    
    var profileImageURL: URL?{
        return URL(string: user.profileImageURL)
    }

    init(user:User){
        self.user = user
    }
    
}
