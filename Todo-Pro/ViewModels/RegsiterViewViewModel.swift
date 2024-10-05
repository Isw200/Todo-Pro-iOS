//
//  RegsiterViewViewModel.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegsiterViewViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String = ""
    
    func register() {
        errorMessage = ""
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserrecord(id: userId)
        }
    }
    
    private func insertUserrecord(id: String) {
        let user = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(user.setDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !confirmPassword.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid email"
            return false
        }
        
        if password != confirmPassword {
            errorMessage = "Passwords do not match"
            return false
        }
        
        guard password.count > 4 else {
            errorMessage = "Password must be at least 5 characters"
            return false
        }
        
        errorMessage = ""
        return true
    }
}
