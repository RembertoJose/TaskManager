//
//  GroupTaskCard.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

struct GroupTaskCard: View {
    var title: TaskGroup
    var taskCount: Int
    var progress: CGFloat
    var color: Color
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(title.rawValue) Project")
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

#Preview {
    GroupTaskCard(title: .home, taskCount: 2, progress: 0.23, color: .blue)
}
