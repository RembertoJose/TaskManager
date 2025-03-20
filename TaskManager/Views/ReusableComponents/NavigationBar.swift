//
//  NavigationBar.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var isAddingProject: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center) {
                
                NavigationLink {
                    HomeScreen()
                        .navigationBarBackButtonHidden()
                } label: {
                    Image(systemName: "house")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                NavigationLink {
                    //
                } label: {
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                Button {
                    isAddingProject = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .clipShape(Circle())
                }
                .padding(.bottom)
                
                Spacer()
                
                NavigationLink {
                    //
                } label: {
                    Image(systemName: "text.page")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                NavigationLink {
                    ProfileScreen()
                        .navigationBarBackButtonHidden()
                } label: {
                    Image(systemName: "person.2")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 85)
            .background(Color.white.shadow(radius: 3))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea(.bottom)
    }
}
#Preview {
    NavigationBar(isAddingProject: .constant(true))
}
