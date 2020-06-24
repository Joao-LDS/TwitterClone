//
//  InputView.swift
//  TwitterClone
//
//  Created by João Luis dos Santos on 24/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class InputView: UIView {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var image: UIImage = {
        let image = UIImage()
        return image
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        return textField
    }()

    init(image: UIImage, textField: UITextField) {
        super.init(frame: .zero)
        self.image = image
        self.textField = textField
        setupView()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

extension InputView: ViewConfiguration {
    func buildView() {
        addSubview(imageView)
        addSubview(textField)
    }
    
    func addConstraints() {
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imageView.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 8, paddingBottom: 8, width: 24, height: 24)
        
        textField.anchor(top: topAnchor, left: imageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    func additionalConfiguration() {
        imageView.image = image
        
    }
    
    
}
