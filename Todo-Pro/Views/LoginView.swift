//
//  LoginView.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(title: "Todo Pro", subtitle: "Get things done!", angle: 10, background: .purple)
                
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(.red)
                            .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                    
                    TLCustomButton(title: "Log In", backgroundColor: .purple) {
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                .scrollContentBackground(.hidden)
                .background(.background)
                
                // Bottom
                VStack {
                    Text("New arround here?")
                        .font(.system(size: 16))
                        .padding(.init(top: 20, leading: 0, bottom: 10, trailing: 0))
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.purple)
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
        .tint(.white)
    }
}

#Preview {
    LoginView()
}
