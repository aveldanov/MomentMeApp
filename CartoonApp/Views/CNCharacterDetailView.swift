//
//  CNCharacterDetailView.swift
//  CartoonApp
//
//  Created by Anton Veldanov on 7/1/23.
//

import UIKit

/// View for single character info
final class CNCharacterDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPurple
        setupViewHierarchy()
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewHierarchy() {

    }


    private func setupViewLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
