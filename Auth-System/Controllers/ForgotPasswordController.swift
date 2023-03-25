//
//  ForgotPasswordController.swift
//  Auth-System
//
//  Created by Kenan Baylan on 17.03.2023.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "Forgot Password", subTitle: "Reset password with mail code.")
    private let emailTextField = CustomTextField(textFieldType: .email)
    private let resetPasswordButton = CustomButton(title: "Send mail", hasBackground: true ,fontSize: .medium)
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
        
        self.resetPasswordButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        
        
        setupUI()
        
    }
    
    private func setupUI(){
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(resetPasswordButton)
        view.addSubview(emailTextField)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
        
            self.headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 200),
            
            
            //Email
            emailTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 20),
            resetPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
            
        ])
        
    }
    
}

extension ForgotPasswordController {
    
    @objc private func forgotPasswordTapped(){
        guard let email = emailTextField.text , !email.isEmpty else { return }
        
        
    }
    
    
    
}
