//
//  TodoListItem.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import Foundation


struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let dueDate: TimeInterval
    let createdAt: TimeInterval
    var isCompleted: Bool
    
    mutating func toggleCompleted(_ state: Bool) {
        isCompleted = state
    }
}
