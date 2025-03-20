//
//  ProjectDataViewModel.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/19/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProjectDataViewModel: ObservableObject {
    
    static let shared = ProjectDataViewModel()
    private var userId: String = ""
    @Published var projects: [ProjectModel]? = nil
    @Published var user: UserModel? = nil
    
    func fetchProjectData() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        self.userId = userId
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("project").getDocuments() { snapshot, error in
            if let error = error {
                print("Error fetching projects: \(error)")
                return
            }
            let projects = snapshot?.documents.compactMap { doc -> ProjectModel? in
                return try? doc.data(as: ProjectModel.self)
            } ?? []
            self.projects = projects
        }
    }
    
    var groupedProjects: [TaskGroup: [ProjectModel]] {
        Dictionary(grouping: projects ?? [], by: { $0.taskGroup })
    }
    
    func deleteItem(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("project").document(id).delete()
    }
}
