//
//  InputView.swift
//  TwitterClone
//
//  Created by João Luis dos Santos on 24/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class InputView: UIView {
    
    // MARK: - Properties
    
    private let imageView: UIImageView = {
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
    
    private var placeHolder = ""

    private var secureText = false
    
    private lazy var lineView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - Init
    
    init(image: UIImage, textField: UITextField, placeHolder: String, secureText: Bool = false) {
        super.init(frame: .zero)
        self.image = image
        self.textField = textField
        self.placeHolder = placeHolder
        self.secureText = secureText
        setupView()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InputView: ViewConfiguration {
    
    // MARK: - Setup View
    
    func buildView() {
        addSubview(imageView)
        addSubview(textField)
        addSubview(lineView)
    }
    
    func addConstraints() {
        
        imageView.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 8, paddingBottom: 8, width: 24, height: 24)
        
        textField.anchor(left: imageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        lineView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
    }
    
    func additionalConfiguration() {
        imageView.image = image
        
        textField.placeholder = placeHolder
        textField.textColor = .white
        textField.font = .systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.isSecureTextEntry = secureText
        
        lineView.backgroundColor = .white
    }
    
    
}
