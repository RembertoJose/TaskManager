//
//  DatePickerSection.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/13/25.
//

import SwiftUI

struct DatePickerSection: View {
    @State var isDatePickerPresented = false
    @State var date: Date
    var isStartDate: Bool
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            if isStartDate {
                Text("Start Date")
                    .font(.caption)
                    .foregroundColor(.gray)
            } else {
                Text("End Date")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Button(action: {
                isDatePickerPresented.toggle()
            }) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.purple)
                    Text("\(date, formatter: dateFormatter)")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(15)
            }
        }
        .sheet(isPresented: $isDatePickerPresented) {
            VStack {
                DatePicker("Select Date", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                Button("Done") {
                    isDatePickerPresented = false
                }
            }
            .presentationDetents([.height(300), .medium, .large])
            .presentationDragIndicator(.automatic)
        }
    }
}

#Preview {
    DatePickerSection(date: Date(), isStartDate: true)
}
