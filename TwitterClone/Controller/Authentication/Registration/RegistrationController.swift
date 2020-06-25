//
//  RegistrationController.swift
//  TwitterClone
//
//  Created by João Luis dos Santos on 24/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Properties
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private let imagePicker = UIImagePickerController()
    
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
    
    private let fullnameTextField: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    private let usernameTextField: UITextField = {
        let tf = UITextField()
        return tf
    }()
       
    private lazy var emailView = InputView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), textField: emailTextField, placeHolder: "Email")

    private lazy var passwordView = InputView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField, placeHolder: "Password", secureText: true)
    
    private lazy var fullnameView = InputView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), textField: fullnameTextField, placeHolder: "Full Name")

    private lazy var usernameView = InputView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: usernameTextField, placeHolder: "Username")
    
    private let signUpButton = Button(title: "Sign Up")
    
    private let alreadyHaveAccountButton = AccountButton(firstText: "Already have an account?", secondText: " Log In")
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        setupView()
    }

    // MARK: - Selectors
    
    @objc func handleLogIn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleAddPhoto() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleSignUp() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        print("Email is \(email)")
        print("Password is \(password)")
    }
    
    // MARK: - Functions
    
    private func setImageButtonFromPicker(image: UIImage) {
        self.plusPhotoButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal) // Set selected image in the button
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.bounds.width / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        plusPhotoButton.imageView?.clipsToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 3
    }
    
}

extension RegistrationController: ViewConfiguration {
    func buildView() {
        view.addSubview(plusPhotoButton)
        
        stackView.addArrangedSubview(emailView)
        stackView.addArrangedSubview(passwordView)
        stackView.addArrangedSubview(fullnameView)
        stackView.addArrangedSubview(usernameView)
        stackView.addArrangedSubview(signUpButton)
        view.addSubview(stackView)
        
        view.addSubview(alreadyHaveAccountButton)
    }
    
    func addConstraints() {
        plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        plusPhotoButton.setDimensions(width: 128, height: 128)
        
        stackView.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingRight: 32)
        
        signUpButton.anchor(left: stackView.leftAnchor, bottom: stackView.bottomAnchor, right: stackView.rightAnchor, height: 50)
        
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingBottom: 16, paddingRight: 40)
    }
    
    func additionalConfiguration() {
        view.backgroundColor = .twitterBlue
        
        plusPhotoButton.setImage(UIImage(named: "plus_photo"), for: .normal)
        plusPhotoButton.tintColor = .white
        plusPhotoButton.addTarget(self, action: #selector(handleAddPhoto), for: .touchUpInside)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        alreadyHaveAccountButton.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
    }
    
}

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        setImageButtonFromPicker(image: image)
        dismiss(animated: true, completion: nil)
    }
}
