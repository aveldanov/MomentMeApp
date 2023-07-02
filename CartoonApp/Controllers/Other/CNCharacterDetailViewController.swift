//
//  CNCharacterDetailViewController.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/1/23.
//

import UIKit

/// Controllet to show about a specific character
final class CNCharacterDetailViewController: UIViewController {


    private let viewModel: CNCharacterDetailViewViewModel
    init(viewModel: CNCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }



}
