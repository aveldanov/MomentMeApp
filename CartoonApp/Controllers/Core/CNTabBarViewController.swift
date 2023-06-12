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
        view.backgroundColor = .red
        setupTabs()
    }

    private func setupTabs() {
        let charactersViewController = CNCharactersViewController()
        let locationsViewController = CNLocationsViewController()
        let episodesViewController = CNEpisodesViewController()
        let settingsViewController = CNSettingsViewController()
    }


}

