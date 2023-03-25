//
//  RegisterController.swift
//  Auth-System
//
//  Created by Kenan Baylan on 17.03.2023.
//

import UIKit

class RegisterController: UIViewController {
    
    
    //MARK: - UIElements
    private let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Create your account.")
    
    
    private let emailTextField = CustomTextField(textFieldType: .email)
    private let passwordTextField = CustomTextField(textFieldType: .password)
    private let phoneNumberTextfield = CustomTextField(textFieldType: .phone)
    private let nameTextfield = CustomTextField(textFieldType: .name)
    private let lastnameTextfield = CustomTextField(textFieldType: .lastname)
    private let usernameTextfield = CustomTextField(textFieldType: .username)
    private let confirmPasswordTextfield = CustomTextField(textFieldType: .confirmPassword)
    
    private let signInButton = CustomButton(title: "Already have an account? Sign In",  fontSize: .small)
    private let signUpButton = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .medium)
    
    
    private let termsTextView: UITextView = {
        
        let attributedString = NSMutableAttributedString(string: "By creating an account , you agree to our Terms & Conditions and you ancknowledge that you have a read our Privacy Policy.")
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        
        attributedString.addAttribute(.link, value: "privacy://privacyAndPolicy", range: (attributedString.string as NSString).range(of: "Privacy Policy."))
        
        let terms = UITextView()
        terms.backgroundColor = .clear
        terms.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        terms.attributedText = attributedString
        terms.textColor = .label
        terms.isSelectable = true
        terms.isEditable = false
        terms.delaysContentTouches = false
        terms.isScrollEnabled = false
        return terms
        
    }()
    
    //MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.termsTextView.delegate = self
        self.setupUI()
        
        //Selector target.
        self.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    
    //MARK: setup UI
    private func setupUI() {
        
        view.backgroundColor = .systemBackground
        
        // view.addSubview(headerView)
        
        
        view.addSubview(nameTextfield)
        view.addSubview(lastnameTextfield)
        view.addSubview(phoneNumberTextfield)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextfield)
        view.addSubview(usernameTextfield)
        
        //buttons
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        view.addSubview(termsTextView)
        
        
        //headerView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextfield.translatesAutoresizingMaskIntoConstraints = false
        nameTextfield.translatesAutoresizingMaskIntoConstraints = false
        lastnameTextfield.translatesAutoresizingMaskIntoConstraints = false
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
        
        NSLayoutConstraint.activate([
            //HeaderView
            //            self.headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            //            self.headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //            self.headerView.trailingAnchor.constraint (equalTo: view.trailingAnchor),
            //            self.headerView.heightAnchor.constraint (equalToConstant: 200),
            //
            //MARK: Textfield
            
            nameTextfield.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 20),
            nameTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextfield.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            lastnameTextfield.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor,constant: 20),
            lastnameTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastnameTextfield.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            usernameTextfield.topAnchor.constraint(equalTo: lastnameTextfield.bottomAnchor,constant: 20),
            usernameTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextfield.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            phoneNumberTextfield.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor,constant: 20),
            phoneNumberTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneNumberTextfield.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            emailTextField.topAnchor.constraint(equalTo: phoneNumberTextfield.bottomAnchor, constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            confirmPasswordTextfield.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmPasswordTextfield.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            //MARK: Buttons
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextfield.bottomAnchor, constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            signUpButton.heightAnchor.constraint(equalToConstant: 55),
            
            termsTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor,constant: 20),
            termsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            termsTextView.heightAnchor.constraint(equalToConstant: 60),
            
            
            signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant:10),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            signInButton.heightAnchor.constraint(equalToConstant: 30),
            
            
        ])
    }
    
}


extension RegisterController {
    
    
    //MARK: - Selectors:
    @objc private func signInButtonTapped(){
        
        let userRequest = RegisterUser(name: nameTextfield.text ?? "" ,
                                       lastname: lastnameTextfield.text ?? "",
                                       username: usernameTextfield.text ?? "",
                                       email: emailTextField.text ?? "" ,
                                       phone: phoneNumberTextfield.text ?? "" ,
                                       password: passwordTextField.text ?? "" )
        
        
        if !Validation.isValidName(for: userRequest.name) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        if !Validation.isValidLastname(for: userRequest.lastname) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        if !Validation.isValidUsername(for: userRequest.username) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        if !Validation.isValidEmail(for: userRequest.email) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        if !Validation.isValidPhoneNumber(for: userRequest.phone) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        
        if !Validation.isValidPhoneNumber(for: userRequest.password) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        guard let request = Endpoints.createAccount(userRequest: userRequest).request else { return }
        
        AuthService.createAccount(request: request) { response in
            
            switch response {
            case .success(_):
                break
            case .failure(let error):
                guard let error = error as? ServiceError else { return }
                
                switch error {
                    
                case .serverError(_):
                    break
                case .unknow(_):
                    break
                case .decodingError(let string):
                    AlertManager.showRegistrationErrorAlert(on: self, with: string)
                }
                
            }
            
        }
        
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    @objc private func signUpButtonTapped(){
        print("clicked : signup buttton")
        
        let webViewer = WebViewController(with: "www.google.com")
        let nav = UINavigationController(rootViewController: webViewer )
        
        self.present(nav, animated: true)
        
    }
}

extension RegisterController : UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "terms" {
            showWebView(urlString: "https://policies.google.com/terms?hl=tr")
        } else if URL.scheme == "privacy" {
            showWebView(urlString: "https://policies.google.com/terms?hl=en")
        }
        
        return true
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
        
        
    }
    
    private func showWebView(urlString: String) {
        let vc = WebViewController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true)
    }
    
}

