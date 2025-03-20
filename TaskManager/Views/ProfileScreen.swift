//
//  ProfileScreen.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/18/25.
//

import SwiftUI

struct ProfileScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var profileViewModel = ProfileDataViewModel.shared
    @State private var isProfile: Bool = false
    
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .foregroundColor(.black)
            }
            
            Spacer()
            
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
                .navigationDestination(isPresented: .constant(true), destination: {
                    LoginScreen()
                })
                .padding(.top, 10)

            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.purple.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
        }
        .safeAreaInset(edge: .bottom) {
            NavigationBar(isAddingProject: $isProfile)
        }
        .navigationTitle("Profile")
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $isProfile) {
            ProfileScreen()
        }
    }
}
#Preview {
    ProfileScreen()
}
