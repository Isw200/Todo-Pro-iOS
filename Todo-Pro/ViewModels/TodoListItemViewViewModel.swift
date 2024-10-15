//
//  TodoListItemViewViewModel.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

/// Single Todo List Item Row

class TodoListItemViewViewModel: ObservableObject {
    init(){}
    
    func toggleCompleted(item: TodoListItem){
        var copiedItem = item
        copiedItem.isCompleted.toggle()
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(copiedItem.id)
            .setData(copiedItem.setDictionary())
    }
}
