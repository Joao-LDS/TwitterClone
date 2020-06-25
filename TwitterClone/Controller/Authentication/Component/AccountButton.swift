//
//  AccountButton.swift
//  TwitterClone
//
//  Created by João Luis dos Santos on 25/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class AccountButton: UIButton {
    
    // MARK: - Properties

    private var firstText = ""
    private var secondText = ""
    
    // MARK: - Init
    
    init(firstText: String, secondText: String) {
        super.init(frame: .zero)
        self.firstText = firstText
        self.secondText = secondText
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountButton: ViewConfiguration {
    func buildView() {
    }
    
    func addConstraints() {
        anchor(height: 40)
    }
    
    func additionalConfiguration() {
        let attributedTitle = NSMutableAttributedString(string: firstText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: secondText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        setAttributedTitle(attributedTitle, for: .normal)
    }
    
}
