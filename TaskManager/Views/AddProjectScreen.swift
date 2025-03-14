//
//  AddProjectScreen.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

struct AddProjectScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var projectName = ""
    @State private var description = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var selectedTaskGroup = "Work"
    @State private var isEndDatePickerPresented = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Text("Add Project")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "bell.fill")
                    .foregroundColor(.purple)
            }
            .padding()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Menu {
                        Button("Work") { selectedTaskGroup = "Work" }
                        Button("Personal") { selectedTaskGroup = "Personal" }
                        Button("Others") { selectedTaskGroup = "Others" }
                    } label: {
                        HStack {
                            Image(systemName: "folder.fill")
                                .foregroundColor(.pink)
                            Text("Task Group")
                                .font(.body)
                                .foregroundColor(.black)
                            Spacer()
                            Text(selectedTaskGroup)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(15)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Project Name")
                            .font(.caption)
                            .foregroundColor(.gray)
                        TextField("Enter project name", text: $projectName)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(15)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.caption)
                            .foregroundColor(.gray)
                        TextEditor(text: $description)
                            .frame(height: 100)
                            .padding()
                            .scrollContentBackground(.hidden)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(15)
                    }
                    
                    DatePickerSection(date: startDate, isStartDate: true)
                    DatePickerSection(date: endDate, isStartDate: false)
                    
                    Button(action: {
                        // Add project logic
                    }) {
                        Text("Add Project")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(15)
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
        }
    }
}

#Preview {
    AddProjectScreen()
}
