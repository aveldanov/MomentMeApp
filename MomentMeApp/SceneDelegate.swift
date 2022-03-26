//
//  SceneDelegate.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/4/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        

        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = MainTabController()
//         window?.rootViewController = UINavigationController(rootViewController: LoginController())
     

        
        //fixing transparent bar
        
        if #available(iOS 15.0, *){
            let appearanceTabBar = UITabBarAppearance()
            let appearanceNavBar = UINavigationBarAppearance()
            UITabBar.appearance().scrollEdgeAppearance = appearanceTabBar
        }
        
        
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

