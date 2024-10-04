//
//  RegisterView.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start organizing tasks!", angle: -10, background: .pink)
            
            // Register Form
            Form {
                TextField("Email Address", text: $name)
                    .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .autocorrectionDisabled()
                TextField("Email Address", text: $email)
                    .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                TLCustomButton(title: "Regsiter", backgroundColor: .pink) {
                    // Register
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
