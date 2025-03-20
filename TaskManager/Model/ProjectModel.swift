//
//  ProjectModel.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/17/25.
//

import Foundation

enum TaskGroup: String, Codable, CaseIterable {
    case work = "Work"
    case personal = "Personal"
    case home = "Home"
    case others = "Others"
}

struct ProjectModel: Codable, Identifiable {
    let id: String
    let taskGroup: TaskGroup
    let projectName: String
    let projectDescription: String
    let startDate: TimeInterval
    let endDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
