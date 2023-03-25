//
//  Validation.swift
//  Auth-System
//
//  Created by Kenan Baylan on 23.03.2023.
//

import Foundation

class Validation  {
    
    
    static func isValidName(for name: String) -> Bool {
        let name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let nameRegEx = "\\w{4,24}"
        let namePred = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: name)
    }
    
    static func isValidLastname(for lastname: String) -> Bool {
        let lastname = lastname.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastnameRegEx = "\\w{4,24}"
        let lastnamePred = NSPredicate(format: "SELF MATCHES %@", lastnameRegEx)
        return lastnamePred.evaluate(with: lastname)
    }
    
    static func isValidUsername(for username: String) -> Bool {
        let username = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let usernameRegEx = "\\w{4,24}"
        let usernamePred = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
        return usernamePred.evaluate(with: username)
    }
    
    static func isValidPhoneNumber(for phoneNumber: String) -> Bool {
        let phoneNumber = phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)
        let phoneNumberRegEx = "\\w{4,24}"
        let phoneNumberPred = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegEx)
        return phoneNumberPred.evaluate(with: phoneNumber)
    }
    
    
    static func isValidEmail(for email: String) -> Bool {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    
    static func isPasswordValid(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{6,32}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    
}
