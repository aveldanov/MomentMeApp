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
        let feed = FeedController()
        let search = SearchController()
        let imageSelctor = ImageSelectorController()
        let notifications = NotificationsController()
        let profile = ProfilerController()
        
        viewControllers = [feed, search, imageSelctor, notifications, profile]
    }
    
    
    func templeteNavigaitonController(unselectedImage:UIImage, selectedImage: UIImage, rootViewController: UIViewController)->UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        
        nav.navigationBar.tintColor = .black
        
        return nav
    }
    
    
}



