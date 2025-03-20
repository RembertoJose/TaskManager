//
//  WelcomeViewModel.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/19/25.
//

import Foundation
import FirebaseAuth

class WelcomeViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        if Auth.auth().currentUser != nil {
            return true
        }
        return false
    }
}
