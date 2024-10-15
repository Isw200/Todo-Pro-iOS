//
//  TodoListItemsView.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    @StateObject var viewModel : TodoListViewViewModel
    @FirestoreQuery var items : [TodoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button ("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showAddTodo.toggle()
                }label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.purple)
                }
            }
            .sheet(isPresented: $viewModel.showAddTodo) {
                NewItemView()
            }
        }
    }
}

#Preview {
    TodoListView(userId: "o5MKFqNIMZU5eb81sR3Wi46LSQB3")
}
