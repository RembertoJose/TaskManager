//
//  ProfileScreen.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/18/25.
//

import SwiftUI

struct ProfileScreen: View {
    @StateObject var profileViewModel = ProfileDataViewModel.shared
    
    
    var body: some View {
        HStack {
            Text("Settings")
                .font(.title3)
                .fontWeight(.bold)
            
            Spacer()
            
            Image(systemName: "bell.fill")
                .foregroundColor(.purple)
        }
        .padding()
        VStack {
            Spacer(minLength: 50)
            
            Text("Your Profile")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("Manage your account details")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
                .padding(.bottom, 20)
            
            VStack(spacing: 15) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name:")
                            .bold()
                        Spacer()
                        Text(profileViewModel.user?.name ?? "N/A")
                            .padding()
                    }
                    HStack {
                        Text("Email:")
                            .bold()
                        Spacer()
                        Text(profileViewModel.user?.email ?? "N/A")
                            .padding()
                    }
                    HStack {
                        Text("Member Since: ")
                            .bold()
                        Spacer()
                        Text("\(Date(timeIntervalSince1970: profileViewModel.user?.joined ?? Date().timeIntervalSince1970).formatted(date: .abbreviated, time: .shortened))")
                            .padding()
                    }
                }
                
                Button(action: {
                    profileViewModel.logout()
                }) {
                    Text("Log Out")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(15)
                }
                .navigationDestination(isPresented: $profileViewModel.isProfile, destination: {
                    LoginScreen()
                        .navigationBarBackButtonHidden()
                })
                .padding(.top, 10)

            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.purple.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}
#Preview {
    ProfileScreen()
}
