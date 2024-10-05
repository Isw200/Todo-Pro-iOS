//
//  TodoListItemsView.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showAddTodo.toggle()
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showAddTodo) {
                NewItemView()
            }
        }
    }
}

#Preview {
    TodoListView(userId: "0000")
}
