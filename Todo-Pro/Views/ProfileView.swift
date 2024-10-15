//
//  ProfileView.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    profileView(user: user)
                } else {
                    Text("Loading...")
                }
            }
            .navigationTitle("Profile")
            .onAppear {
                viewModel.fatchUser()
            }
        }
    }
    
    @ViewBuilder
    func profileView(user: User) -> some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .frame(width: 130, height: 130)
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.purple)
        
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
                .foregroundStyle(.purple)
            
            Text(user.email)
                .font(.subheadline)
                .foregroundStyle(.purple)
            
            Text("Member Since: \(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .standard))")
        }
        
        Spacer()
        
        TLCustomButton(title: "Log Out", backgroundColor: .red, action: {
            viewModel.logout()
        })
        .frame(width: 120, height: 100)
    }
}

#Preview {
    ProfileView()
}
