//
//  MainTabController.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/4/22.
//

import UIKit
import Firebase


class MainTabController: UITabBarController{
    
    // MARK: - Properties
    
    private var user: User?{
        didSet{
            guard let user = user else {
                return
            }
            configureViewControllers(withUser: user)
        }
    }
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        fetchUser()
    }
        
    // MARK: - API
    
    func fetchUser(){
        UserService.fetchUser { user in
            self.user = user
        }
    }
    
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                let controller = LoginController()
                controller.delegate = self
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
 
    
    // MARK: - Helpers
    
    func configureViewControllers(withUser user: User){
        view.backgroundColor = .white
        
        let feedLayout = UICollectionViewFlowLayout()
        
        let feed = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "home_unselected") , selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController(collectionViewLayout: feedLayout))
        let search = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "search_unselected") , selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        let imageSelctor = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "plus_unselected") , selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController())
        let notifications = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "like_unselected") , selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationsController())
        
        let profileContoller = ProfileController(user: user)
        
        let profile = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "profile_unselected") , selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: profileContoller)
        
        viewControllers = [feed, search, imageSelctor, notifications, profile]
        tabBar.tintColor = .black
    }
    
    
    func templateNavigaitonController(unselectedImage:UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        
        nav.navigationBar.tintColor = .black
        
        return nav
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}

extension MainTabController: AuthenticationDelegate{
    func authenticationDidComplete() {
        print("[MainTabController] AUTH complete")
        fetchUser()
        self.dismiss(animated: true, completion: nil)
    }
}
