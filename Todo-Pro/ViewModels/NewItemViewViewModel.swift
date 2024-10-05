//
//  NewItemViewViewModel.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import Foundation

/// Add Todo Sheet View

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate = Date()
    
    init(){}
}
