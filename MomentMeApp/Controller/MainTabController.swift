//
//  MainTabController.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/4/22.
//

import UIKit
import Firebase


class MainTabController: UITabBarController{
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        configureViewControllers()
//        logout()
    }
    
    // MARK: - API
    
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    func logout(){
        do{
           try Auth.auth().signOut()
        } catch{
            print("[MainTabController] failed to signout")
        }
    }
    
    // MARK: - Helpers
    
    func configureViewControllers(){
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        
        let feed = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "home_unselected") , selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))
        let search = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "search_unselected") , selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        let imageSelctor = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "plus_unselected") , selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController())
        let notifications = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "like_unselected") , selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationsController())
        let profile = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "profile_unselected") , selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfilerController())
        
        viewControllers = [feed, search, imageSelctor, notifications, profile]
        tabBar.tintColor = .black
    }
    
    
    func templateNavigaitonController(unselectedImage:UIImage, selectedImage: UIImage, rootViewController: UIViewController)->UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        
        nav.navigationBar.tintColor = .black
        
        return nav
    }
    
    
}



