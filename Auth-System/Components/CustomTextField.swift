//
//  CustomTextField.swift
//  Auth-System
//
//  Created by Kenan Baylan on 17.03.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case email
        case password
        case username
        case phone
        case name
        case lastname
        case confirmPassword
        case newPassword
    }
    
    
    private let authFieldType : CustomTextFieldType
    
    init(textFieldType: CustomTextFieldType) {
        self.authFieldType = textFieldType
        
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 55)
        ])
        
        switch authFieldType {
        case .email:
            self.placeholder = "Email Address"
            self.textContentType = .emailAddress
            self.keyboardType = .emailAddress
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .username:
            self.placeholder = "Username"
        case .phone:
            self.placeholder = "Phone Number"
            self.keyboardType = .numberPad
            
        case .name:
            self.placeholder = "Name"
        case .lastname:
            self.placeholder = "Last name"
            
        case .confirmPassword:
            self.placeholder = "Confirm password"
        case .newPassword:
            self.placeholder = "New Password"
        }
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
