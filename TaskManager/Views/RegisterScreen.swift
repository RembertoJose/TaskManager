//
//  RegisterScreen.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/13/25.
//

import SwiftUI

struct RegisterScreen: View {

    @StateObject var registerViewModel = RegisterViewModel()
    @StateObject private var profileViewModel = ProfileDataViewModel.shared
    @State private var isShowHomeScreen: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "person.crop.circle.badge.plus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
                .foregroundColor(.purple)
                .padding(.bottom, 20)
            
            Text("Create Account")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("Sign up to start managing your tasks effortlessly.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
                .padding(.bottom, 20)
            
            VStack(spacing: 15) {
                TextField("Full Name", text: $registerViewModel.name)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .autocapitalization(.words)
                
                TextField("Email", text: $registerViewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $registerViewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                SecureField("Confirm Password", text: $registerViewModel.confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            Button(action: {
                registerViewModel.register()
                if registerViewModel.validate() {
                    isShowHomeScreen = true
                }
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(15)
            }
            .navigationDestination(isPresented: $isShowHomeScreen) {
                HomeScreen()
                    .navigationBarBackButtonHidden()
                    .environmentObject(profileViewModel)
            }
            .padding(.top, 20)
            
            NavigationLink {
                LoginScreen()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Already have an account? Log In")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            .padding(.top, 10)
            
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
    RegisterScreen()
}
