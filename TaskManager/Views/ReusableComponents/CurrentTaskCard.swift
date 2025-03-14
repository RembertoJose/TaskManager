//
//  TaskCard.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

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

#Preview {
    TaskCard(title: "Test Task", category: "Test Category", progress: 30, color: .blue)
}
