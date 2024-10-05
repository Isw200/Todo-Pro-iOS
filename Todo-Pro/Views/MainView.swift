//
//  ContentView.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-04.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            acountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var acountView: some View {
        TabView{
            TodoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label(title: { Text("Todos") }, icon: { Image(systemName: "list.bullet") })
                }
            ProfileView()
                .tabItem {
                    Label(title: { Text("Profile") }, icon: { Image(systemName: "person.crop.circle") })
                }
        }
    }
}

#Preview {
    MainView()
}
