//
//  Button.swift
//  TwitterClone
//
//  Created by João Luis dos Santos on 25/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    // MARK: - Properties
    
    private var title: String = ""
    
    // MARK: - Init
    
    init(title: String) {
        super.init(frame: .zero)
        self.title = title
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Button: ViewConfiguration {
    func buildView() {
    }
    
    func addConstraints() {
    }
    
    func additionalConfiguration() {
        setTitle(title, for: .normal)
        setTitleColor(.twitterBlue, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backgroundColor = .white
        layer.cornerRadius = 5
    }
    
    
}
