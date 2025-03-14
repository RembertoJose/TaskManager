//
//  TodayTaskCard.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

struct TodayTaskCard: View {
    var titleText: String
    var buttonText: String
    var progress: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(titleText)
                .font(.headline)
                .foregroundColor(.white)
            
            HStack {
                Button(action: {}) {
                    Text(buttonText)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .stroke(lineWidth: 6)
                        .opacity(0.3)
                        .foregroundColor(.white)
                    
                    Circle()
                        .trim(from: 0.0, to: progress)
                        .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round))
                        .foregroundColor(.white)
                        .rotationEffect(Angle(degrees: -90))
                    
                    Text("\(Int(progress * 100))%")
                        .font(.body)
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(width: 50, height: 50)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.purple)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

#Preview {
    TodayTaskCard(titleText: "Your todays's task \nalmost done!", buttonText: "View Task", progress: 0.85)
}
