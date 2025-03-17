//
//  Users.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/14/25.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
