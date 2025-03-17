//
//  AddProjectScreen.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/12/25.
//

import SwiftUI

struct AddProjectScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = AddProjectViewModel()
    
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
                        Button("Work") { viewModel.taskGroup = .work }
                        Button("Personal") { viewModel.taskGroup = .personal }
                        Button("Home") { viewModel.taskGroup = .home }
                        Button("Others") { viewModel.taskGroup = .others }
                    } label: {
                        HStack {
                            Image(systemName: "folder.fill")
                                .foregroundColor(.pink)
                            Text("Task Group")
                                .font(.body)
                                .foregroundColor(.black)
                            Spacer()
                            Text(viewModel.taskGroup.rawValue)
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
                        TextField("Enter project name", text: $viewModel.projectTitle)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(15)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.caption)
                            .foregroundColor(.gray)
                        TextEditor(text: $viewModel.projectDescription)
                            .frame(height: 100)
                            .padding()
                            .scrollContentBackground(.hidden)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(15)
                    }
                    
                    DatePickerSection(date: $viewModel.startDate, isStartDate: true)
                    DatePickerSection(date: $viewModel.endDate, isStartDate: false)
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    Button(action: {
                        if viewModel.canSave {
                            viewModel.save()
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            
                        }
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
