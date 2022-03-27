//
//  ImageUploader.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/25/22.
//

import Foundation
import Firebase

struct ImageUploader{
    static func uploadImage(image: UIImage, completeion: @escaping (String)->Void){
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else{
            return
        }
        let filename = NSUUID().uuidString
        
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error{
                print("[ImageUploader] error",error.localizedDescription)
            }
            
            ref.downloadURL { url, error in
                guard let imageURL = url?.absoluteString else{
                    return
                }
                completeion(imageURL)
            }
        }
    }
}



