//
//  RegisterView.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegsiterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start organizing tasks!", angle: -10, background: .pink)
            
            // Register Form
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.red)
                        .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
                
                TextField("User Name", text: $viewModel.name)
                    .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                SecureField("Confirem Password", text: $viewModel.confirmPassword)
                
                TLCustomButton(title: "Regsiter", backgroundColor: .pink) {
                    viewModel.register()
                }
            }
            .scrollContentBackground(.hidden)
            .background(.background)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
