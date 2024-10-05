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
                //                    .datePickerStyle()
                
                TLCustomButton(title: "Add task", backgroundColor: .purple) {
                    //
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
        }
    }
}

#Preview {
    NewItemView()
}
