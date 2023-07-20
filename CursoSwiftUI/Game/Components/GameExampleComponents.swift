//
//  GameExampleComponents.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 19/07/23.
//

// Componente genérico

import SwiftUI

struct myTextButton: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300)
    }

}

struct myButton: ViewModifier {

    func body(content: Content) -> some View {
        content
            .background(.blue)
            .shadow(radius: 10)
            .cornerRadius(10)
    }

}

