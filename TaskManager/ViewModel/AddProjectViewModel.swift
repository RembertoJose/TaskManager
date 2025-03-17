//
//  AddProjectViewModel.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/17/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddProjectViewModel: ObservableObject {
    
    @Published var taskGroup: TaskGroup = .work
    @Published var projectTitle: String  = ""
    @Published var projectDescription: String  = ""
    @Published var startDate = Date()
    @Published var endDate = Date()
    @Published var showAlert: Bool = false
    @Published var errorMessage: String = ""
        
    func save() {
        guard canSave else { return }
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let newID = UUID().uuidString
        let newItem = ProjectModel(id: newID, taskGroup: taskGroup, projectName: projectTitle, projectDescription: projectDescription, startDate: startDate.timeIntervalSince1970, endDate: endDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        let db  = Firestore.firestore()
        db.collection("users").document(uId).collection("project").document(newID).setData(try! newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !projectTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Project title is required."
            return false
        }
        guard startDate >= Date().addingTimeInterval(-86400) else {
            errorMessage = "Start date must be today or later."
            return false
        }
        guard startDate <= endDate else {
            errorMessage = "Start date must be before end date."
            return false
        }
        return true
    }
}
