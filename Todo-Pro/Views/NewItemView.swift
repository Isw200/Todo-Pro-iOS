//
//  NewItemView.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import SwiftUI

struct NewItemView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = NewItemViewViewModel()
    
    var body: some View {
        NavigationStack {
            Form{
                TextField("Title", text: $viewModel.title)
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                
                ZStack(alignment: .leading){
                    if viewModel.description.isEmpty {
                        Text("Description")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .light))
                    }
                    
                    TextEditor(text: $viewModel.description)
                }
                
                TLCustomButton(title: "Add task", backgroundColor: .purple) {
                    viewModel.addTodo()
                    dismiss()
                }
            }
            .navigationBarTitle("Add New Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }.tint(.red)
                }
            }
            .alert(isPresented: $viewModel.showError) {
                Alert(title: Text("Error"), message: Text("\(viewModel.errorMessage)")) 
            }
        }
    }
}

#Preview {
    NewItemView()
}
