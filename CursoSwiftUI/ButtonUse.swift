//
//  ButtonUse.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 03/07/23.
//

import SwiftUI

struct ButtonUse: View {
    var body: some View {
        VStack {
            Btn1View()
            Spacer()// empujar los elementos hasta el tope
            Btn2View()
        }
    }
}

struct ButtonUse_Previews: PreviewProvider {
    static var previews: some View {
        ButtonUse()
    }
}

struct Btn1View: View {
    var body: some View {
        Button(action: {
            print("Btn 2")
        }, label: {
            Text("Bienvenido al curso").fontWeight(.bold).font(.title)
                .foregroundColor(.white)
                .padding()
                .shadow(radius: 10)
        }).frame(width: 300)
            .background(.red)
            .cornerRadius(15)
    }
}

struct Btn2View: View {
    var body: some View {
        Button(action: {
            print("Btn 2")
        }, label: {
            Circle()
                .fill(.green)
                .frame(width: 200, height: 200)
                .shadow(radius: 10)
                .overlay(content: {
                    Image(systemName: "iphone")
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .bold))
                })
        })
    }
}
