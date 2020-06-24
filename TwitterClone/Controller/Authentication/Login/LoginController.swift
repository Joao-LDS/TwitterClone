//
//  LoginController.swift
//  TwitterClone
//
//  Created by João Luis dos Santos on 24/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - Properties
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var emailView: UIView = {
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let textField = UITextField()
        textField.placeholder = "Email"
        let view = InputView(image: image, textField: textField)
        return view
    }()
    
    lazy var passwordView: UIView = {
        let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        let textField = UITextField()
        textField.placeholder = "Password"
        let view = InputView(image: image, textField: textField)
        return view
    }()
    
//    
//    lazy var containerEmail: UIView = {
//        let view = UIImageView()
//        return view
//    }()
//    
//    lazy var containerPassword: UIView = {
//        let view = UIView()
//        return view
//    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Selectors
    
    // MARK: - Functions
    
    /* It doesn't work on NavigationController, only in on ViewController
     This func change statusbar color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
     */

}

extension LoginController: ViewConfiguration {
    
    func buildView() {
        view.addSubview(logoImageView)
//        stackView.addArrangedSubview(containerEmail)
        stackView.addArrangedSubview(emailView)
        stackView.addArrangedSubview(passwordView)
        view.addSubview(stackView)
    }
    
    func addConstraints() {
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
//        containerEmail.anchor(height: 50)
//        containerPassword.anchor(height: 50)
//        
        stackView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
    
    func additionalConfiguration() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black // Change the bar status color to white
        
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = #imageLiteral(resourceName: "TwitterLogo")
        
        stackView.axis = .vertical
        stackView.spacing = 8
//        
//        containerEmail.backgroundColor = .red
//        containerPassword.backgroundColor = .black
    }
    
}
