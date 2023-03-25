//
//  LoginController.swift
//  Auth-System
//
//  Created by Kenan Baylan on 17.03.2023.
//

import UIKit

class LoginController: UIViewController {
    
    
    //MARK: - UIElements
    private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign in to your account.")
    private let emailTextField = CustomTextField(textFieldType: .email)
    private let passwordTextField = CustomTextField(textFieldType: .password)
    
    private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "New User? Create Account", fontSize: .medium)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password?" ,fontSize: .small)
    
    
    //MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
      //  self.newUserButtonTapped()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        //Selector target.
        self.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(newUserButtonTapped), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        
    }
    
    
    //MARK: setup UI
    private func setupUI() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        view.addSubview(signInButton)
        view.addSubview(newUserButton)
        view.addSubview(forgotPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            //HeaderView
            self.headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.headerView.trailingAnchor.constraint (equalTo: view.trailingAnchor),
            self.headerView.heightAnchor.constraint (equalToConstant: 230),
            
            //Email
            emailTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            //Password
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            //Sign In Button
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
            
            //NewUserButton
            newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 11),
            newUserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            newUserButton.heightAnchor.constraint(equalToConstant: 30),
            
            //ForgotPassword Button
            forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 12),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        
    }
    
}


extension LoginController {
        
    
    //MARK: - Selectors:
    
    @objc private func signInButtonTapped(){
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true,completion: nil)
    }
    
    @objc private func newUserButtonTapped() {
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
    @objc private func forgotPasswordButtonTapped() {
        let vc = ForgotPasswordController()
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    
    
}
