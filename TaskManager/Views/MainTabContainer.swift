//
//  MainTabContainer.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/24/25.
//

import SwiftUI

struct MainTabContainer: View {
    @State var selectedTab: Tab = .home
    
    var body: some View {
        VStack {
            Group {
                switch selectedTab {
                case .home:
                    HomeScreen()
                case .calendar:
                    EmptyView()
                case .add:
                    AddProjectScreen()
                case .documents:
                    EmptyView()
                case .profile:
                    ProfileScreen()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .safeAreaInset(edge: .bottom) {
            NavigationBar(selectedTab: $selectedTab)
        }
    }
}
