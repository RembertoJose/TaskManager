//
//  HomeScreen.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var isAddingProject: Bool = false
    @State private var isShowLoginScreen: Bool = false
    
    var body: some View {
        if !viewModel.currentUserId.isEmpty {
            homeView
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
                            
                            Text("Livia Vaccaro")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        Button {
                            viewModel.signOut()
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
                    
                    Text("In Progress  6")
                        .font(.headline)
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            CurrentTaskCard(title: "Grocery shopping app design", category: "Office Project", progress: 0.4, color: .blue)
                            CurrentTaskCard(title: "Uber Eats redesign challenge", category: "Personal Project", progress: 0.2, color: .orange)
                            CurrentTaskCard(title: "American Airline Mock Data", category: "Personal Project", progress: 0.7, color: .blue)
                        }
                        .padding()
                    }
                    
                    Text("Task Groups  4")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    VStack {
                        GroupTaskCard(title: "Office Project", taskCount: 23, progress: 0.7, color: .pink)
                        GroupTaskCard(title: "Personal Project", taskCount: 30, progress: 0.52, color: .purple)
                        GroupTaskCard(title: "Daily Study", taskCount: 30, progress: 0.87, color: .orange)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .safeAreaInset(edge: .bottom) {
                NavigationBar(isAddingProject: $isAddingProject)
            }
            .navigationTitle("Home")
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $isAddingProject) {
                AddProjectScreen()
            }
        }
    }
}

#Preview {
    HomeScreen()
}
