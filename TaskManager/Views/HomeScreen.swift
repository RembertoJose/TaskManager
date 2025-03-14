//
//  HomeScreen.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Profile Header
                HStack {
                    Image("profile_picture") // Replace with actual image asset
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
                    
                    Image(systemName: "bell.fill")
                        .foregroundColor(.purple)
                }
                .padding(.horizontal)

                // Task Progress Card
                VStack(alignment: .leading) {
                    Text("Your today's task\nalmost done!")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack {
                        Button(action: {}) {
                            Text("View Task")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color.white)
                                .cornerRadius(20)
                        }
                        
                        Spacer()
                        
                        CircularProgressView(progress: 0.85)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .cornerRadius(20)
                .padding(.horizontal)

                // In Progress Section
                Text("In Progress  6")
                    .font(.headline)
                    .padding(.horizontal)

                HStack {
                    TaskCard(title: "Grocery shopping app design", category: "Office Project", progress: 0.4, color: .blue)
                    TaskCard(title: "Uber Eats redesign challenge", category: "Personal Project", progress: 0.2, color: .orange)
                }
                .padding(.horizontal)

                // Task Groups Section
                Text("Task Groups  4")
                    .font(.headline)
                    .padding(.horizontal)

                VStack {
                    TaskGroupCard(title: "Office Project", taskCount: 23, progress: 0.7, color: .pink)
                    TaskGroupCard(title: "Personal Project", taskCount: 30, progress: 0.52, color: .purple)
                    TaskGroupCard(title: "Daily Study", taskCount: 30, progress: 0.87, color: .orange)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .safeAreaInset(edge: .bottom) {
            BottomTabBar()
        }
    }
}

// MARK: - Circular Progress View
struct CircularProgressView: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 8)
                .opacity(0.3)
                .foregroundColor(.white)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: -90))
            
            Text("\(Int(progress * 100))%")
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 50, height: 50)
    }
}

// MARK: - Task Card
struct TaskCard: View {
    var title: String
    var category: String
    var progress: CGFloat
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle(tint: color))
        }
        .padding()
        .frame(width: 160, height: 100)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

// MARK: - Task Group Card
struct TaskGroupCard: View {
    var title: String
    var taskCount: Int
    var progress: CGFloat
    var color: Color
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("\(taskCount) Tasks")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 6)
                    .opacity(0.3)
                    .foregroundColor(color)
                
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: -90))
                
                Text("\(Int(progress * 100))%")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .frame(width: 40, height: 40)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

// MARK: - Bottom Tab Bar
struct BottomTabBar: View {
    var body: some View {
        HStack {
            Spacer()
            
            Image(systemName: "calendar")
                .foregroundColor(.gray)
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .clipShape(Circle())
            }
            
            Spacer()
            
            Image(systemName: "folder")
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .background(Color.white.shadow(radius: 3))
    }
}

#Preview {
    HomeScreen()
}
