//
//  HomeScreen.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI
import FirebaseFirestore

struct HomeScreen: View {
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var profileViewModel = ProfileDataViewModel.shared
    @StateObject var projectViewModel = ProjectDataViewModel.shared
    @State private var isAddingProject: Bool = false
    @State private var isShowLoginScreen: Bool = false
    let colors: [Color] = [.orange, .blue, .green, .purple, .red]
    
    var body: some View {
        if !homeViewModel.currentUserId.isEmpty {
            homeView
                .onAppear {
                    profileViewModel.fetchUser()
                    projectViewModel.fetchProjectData()
                }
        } else {
            LoginScreen()
        }
        
    }
    
    @ViewBuilder
    var homeView: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .center) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Hello!")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Text("\(profileViewModel.user?.name ?? "Guest")")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        Button {
                            homeViewModel.signOut()
                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.purple)
                                .frame(width: 25, height: 25)
                        }
                        .navigationDestination(isPresented: $isShowLoginScreen) {
                            LoginScreen()
                                .navigationBarBackButtonHidden()
                        }
                    }
                    .padding(.horizontal)
                    
                    TodayTaskCard(titleText: "Your todays's task \nalmost done!", buttonText: "View Task", progress: 0.85)
                    
                    Text("In Progress \(projectViewModel.projects?.count ?? 0)")
                        .font(.headline)
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(projectViewModel.projects ?? [], id: \.id) { project in
                                CurrentTaskCard(title: project.projectName, category: project.taskGroup, progress: Double.random(in: 0.0...0.99), color: colors.randomElement() ?? .gray)
                            }
                        }
                        .padding()
                    }
                    
                    Text("Task Groups 4")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    VStack {
                        ForEach(TaskGroup.allCases, id: \.self) { category in
                            if let projects = projectViewModel.groupedProjects[category] {
                                if !projects.isEmpty {
                                    GroupTaskCard(title: category, taskCount: projects.count, progress: Double.random(in: 0.0...0.99), color: colors.randomElement() ?? .gray)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeScreen()
}
