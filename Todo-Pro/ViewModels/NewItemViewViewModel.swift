//
//  NewItemViewViewModel.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

/// Add Todo Sheet View

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate = Date()
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    init(){}
    
    func addTodo(){
        guard validate() else { return }
        
        errorMessage = ""
        showError = false
        
        // Get user id
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        let newTodoID = UUID().uuidString
        // New Model
        let newTodo = TodoListItem(
            id: newTodoID,
            title: title,
            description: description,
            dueDate: dueDate.timeIntervalSince1970,
            createdAt: Date().timeIntervalSince1970,
            isCompleted: false
        )
        
        // Save Model
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(newTodoID)
            .setData(newTodo.setDictionary())
    }
    
    func validate() -> Bool{
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please fill all feilds!"
            showError = true
            return false
        }
        
        guard !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please fill all feilds!"
            showError    = true
            return false
        }
        
        if dueDate >= Date().addingTimeInterval(60 * 60 * 24){
            errorMessage = "Due date cannot be in the past!"
            showError    = true
            return false
        }
        
        return true
    }
}
