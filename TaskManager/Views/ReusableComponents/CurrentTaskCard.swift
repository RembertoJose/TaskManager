//
//  TaskCard.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

struct CurrentTaskCard: View {
    var title: String
    var category: TaskGroup
    var progress: CGFloat
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(category.rawValue)")
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
    CurrentTaskCard(title: "Test Task", category: .home, progress: 30, color: .blue)
}
