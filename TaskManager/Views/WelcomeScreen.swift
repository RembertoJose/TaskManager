//
//  ContentView.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

struct WelcomeScreen: View {
    private let imageURL: String = "https://d3ueqtv14wizl1.cloudfront.net/Essay_introduction_generator_1a830841e4.png"
    var body: some View {
        VStack {
            Spacer()
            
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
            } placeholder: {
                ProgressView()
            }
            
            Spacer()
            
            Text("Task Management &\nTo-Do List")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
            
            Spacer()
            
            NavigationLink(destination: HomeScreen()) {
                HStack {
                    Text("Let’s Start")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .cornerRadius(15)
                .padding(.horizontal, 5)
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer(minLength: 30)
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.purple.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    WelcomeScreen()
}
