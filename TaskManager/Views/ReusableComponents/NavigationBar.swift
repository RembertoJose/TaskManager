//
//  NavigationBar.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

enum Tab {
    case home, calendar, add, documents, profile
}

struct NavigationBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center) {
                
                Button {
                    selectedTab = .home
                } label: {
                    Image(systemName: "house")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                Button {
                    selectedTab = .calendar
                } label: {
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                Button {
                    selectedTab = .add
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .clipShape(Circle())
                }
                .padding(.bottom)
                
                Spacer()
                
                Button {
                    selectedTab = .documents
                } label: {
                    Image(systemName: "text.page")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                Button {
                    selectedTab = .profile
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
    NavigationBar(selectedTab: .constant(.home))
}
