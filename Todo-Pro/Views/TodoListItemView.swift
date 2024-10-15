//
//  TodoListItemView.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    let item: TodoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.system(size: 20, weight: .semibold))
                
                Text(item.description)
                    .font(.title3)
                    .padding(.top, 0.5)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .standard))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleCompleted(item: item)
            } label: {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.purple)
            }
        }
    }
}

#Preview {
    TodoListItemView(item: .init(id: "111", title: "Get groceries", description: "This is a test", dueDate: Date().timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isCompleted: false))
}
