//
//  LoginViewModel.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/17/25.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    func login() {
        guard validate() else { return }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please enter both email and password."
            return false
        }
        
        guard email.contains( "@" ) && email.contains( "." ) else {
            errorMessage = "Please enter a valid email address."
            return false
        }
        
        guard password.count >= 8 else {
            errorMessage = "Password must be at least 8 characters long."
            return false
        }
        
        return true
    }
    
    public var isSignedIn: Bool {
        if Auth.auth().currentUser != nil {
            return true
        } else {
            errorMessage = "Login Failed, Please try again."
            return false
        }
    }
    
}
