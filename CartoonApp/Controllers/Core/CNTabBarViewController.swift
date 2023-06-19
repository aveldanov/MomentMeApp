//
//  ViewController.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 6/11/23.
//

import UIKit

final class CNTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let charactersViewController = CNCharactersViewController()
        let locationsViewController = CNLocationsViewController()
        let episodesViewController = CNEpisodesViewController()
        let settingsViewController = CNSettingsViewController()

        charactersViewController.navigationItem.largeTitleDisplayMode = .automatic
        locationsViewController.navigationItem.largeTitleDisplayMode = .automatic
        episodesViewController.navigationItem.largeTitleDisplayMode = .automatic
        settingsViewController.navigationItem.largeTitleDisplayMode = .automatic

        let navigationController1 = UINavigationController(rootViewController: charactersViewController)
        let navigationController2 = UINavigationController(rootViewController: locationsViewController)
        let navigationController3 = UINavigationController(rootViewController: episodesViewController)
        let navigationController4 = UINavigationController(rootViewController: settingsViewController)

        navigationController1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        navigationController2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 1)
        navigationController3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 1)
        navigationController4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)

        let navigationControllers = [navigationController1, navigationController2, navigationController3, navigationController4]

        for nav in navigationControllers {
            nav.navigationBar.prefersLargeTitles = true
        }

        setViewControllers(
            navigationControllers,
            animated: true)
    }
}

