//
//  Coordinator.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/20/25.
//

import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var currentScreen: Screen = .home
    
    enum Screen {
        case home
        case detail
        case settings
    }
    
    func goToDetail() {
        currentScreen = .detail
    }
    
    func goToSettings() {
        currentScreen = .settings
    }
    
    func goBack() {
        currentScreen = .home
    }
}
