//
//  SignUpCellModel.swift
//  Sift
//
//  Created by Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//

import UIKit

class SignUpCellModel {
    
    enum SignUpCellType: String {
        case fullName = "Full Name"
        case email = "Email"
        case phoneNumber = "Phone Number"
        case password = "Password"
    }
    
    var type: SignUpCellType
    var value: String?
    
    var placeholder: String {
        return type.rawValue
    }
    
    var contentType: UITextContentType {
        switch type {
        case .fullName:
            return .name
        case .email:
            return .emailAddress
        case .phoneNumber:
            return .telephoneNumber
        case .password:
            return .password
        }
    }
    
    var autocapitalizationType: UITextAutocapitalizationType {
        switch type {
        case .fullName:
            return .words
        default:
            return .none
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch type {
        case .fullName:
            return .namePhonePad
        case .email:
            return .emailAddress
        case .phoneNumber:
            return .phonePad
        case .password:
            return .default
        }
    }
    
    var isSecureTextEntry: Bool {
        switch type {
        case .password:
            return true
        default:
            return false
        }
    }
    
    init(type: SignUpCellType) {
        self.type = type
    }
}
