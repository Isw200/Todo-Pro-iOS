//
//  CustomButton.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import SwiftUI

struct TLCustomButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                Text(title)
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .bold()
                    .padding(10)
            }
            .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 0))
        }
    }
}

#Preview {
    TLCustomButton(title: "Button", backgroundColor: .blue, action: {})
}
