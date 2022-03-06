//
//  MainTabController.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/4/22.
//

import UIKit


class MainTabController: UITabBarController{
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
        
    }
    
    // MARK: - Helpers
    
    func configureViewControllers(){
        view.backgroundColor = .white
        let feed = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "home_unselected") , selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController())
        let search = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "search_unselected") , selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        let imageSelctor = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "plus_unselected") , selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController())
        let notifications = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "like_unselected") , selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationsController())
        let profile = templateNavigaitonController(unselectedImage: #imageLiteral(resourceName: "profile_unselected") , selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfilerController())
        
        viewControllers = [feed, search, imageSelctor, notifications, profile]
    }
    
    
    func templateNavigaitonController(unselectedImage:UIImage, selectedImage: UIImage, rootViewController: UIViewController)->UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        
        nav.navigationBar.tintColor = .black
        
        return nav
    }
    
    
}



