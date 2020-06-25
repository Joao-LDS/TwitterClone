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
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    private lazy var emailView = InputView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), textField: emailTextField, placeHolder: "Email", secureText: true)
 
    private lazy var passwordView = InputView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField, placeHolder: "Password", secureText: true)

    private let loginButton = Button(title: "Log In")
    
    private let dontHaveAccountButton = AccountButton(firstText: "Don't have an account?", secondText: " Sign Up")
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Selectors
    
    @objc func handleLogin() {
        print(123)
    }
    
    @objc func handleSignUp() {
        let registrationController = RegistrationController()
        navigationController?.pushViewController(registrationController, animated: true)
    }
    
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
        stackView.addArrangedSubview(emailView)
        stackView.addArrangedSubview(passwordView)
        stackView.addArrangedSubview(loginButton)
        view.addSubview(stackView)
        view.addSubview(dontHaveAccountButton)
    }
    
    func addConstraints() {
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        logoImageView.setDimensions(width: 150, height: 150)
        
        stackView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingRight: 32)
        
        loginButton.anchor(left: stackView.leftAnchor, bottom: stackView.bottomAnchor, right: stackView.rightAnchor, height: 50)
        
        dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingBottom: 16, paddingRight: 40)
    }
    
    func additionalConfiguration() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black // Change the bar status color to white
        
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = #imageLiteral(resourceName: "TwitterLogo")
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
       
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        dontHaveAccountButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
    }
    
}
