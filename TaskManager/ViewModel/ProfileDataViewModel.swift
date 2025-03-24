//
//  ProfileDataViewModel.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/17/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileDataViewModel: ObservableObject {
    
    static let shared = ProfileDataViewModel()
    @Published var user: UserModel? = nil
    @Published var userId: String = ""
    @Published var isProfile: Bool = false
    
    private init() {}
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        self.userId = userId
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument() { snapshot, error in
            if let error = error {
                print("Error fetching user: \(error)")
                return
            }
            guard let data = snapshot?.data() else { return }
            DispatchQueue.main.async {
                self.user = UserModel(id: data["id"] as? String ?? "",
                                      name: data["name"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    func logout() {
        do {
            isProfile = true
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error)")
        }
    }
}
