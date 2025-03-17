//
//  LoginScreen.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/13/25.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var isShowHomeScreen: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
                .foregroundColor(.purple)
                .padding(.bottom, 20)
                        
            Text("Welcome Back!")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("Log in to continue managing your tasks efficiently.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
                .padding(.bottom, 20)
            
            VStack(spacing: 15) {
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
            }
            .padding(.horizontal, 20)
            
            Button(action: {
                viewModel.login()
                if viewModel.validate() && viewModel.isSignedIn {
                    isShowHomeScreen = true
                }
            }) {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(15)
                    .buttonStyle(PlainButtonStyle())
            }
            .navigationDestination(isPresented: $isShowHomeScreen) {
                HomeScreen()
                    .navigationBarBackButtonHidden()
            }
            .padding(.top, 20)
            
            NavigationLink {
                RegisterScreen()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Register")
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
    LoginScreen()
}
