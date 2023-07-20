//
//  BindingUse.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 06/07/23.
//

import SwiftUI

struct BindingUse: View {

    @State var contador: Int = 0

    // para objetos
//    @StateObject
//    @ObservedObject

    var body: some View {
        VStack {

            NavigationStack {
                Text("Contador: \(contador)")
                    .font(.system(size: 30, weight: .bold))
                    .padding(5)

                NavigationLink("Navegar a segunda pantalla", destination: {
                    BtnCounter(contador: $contador)
                })
            }
        }
    }
}

struct BtnCounter: View {

    @Binding var contador: Int

    var body: some View {
        VStack {
            Button(action: {
                self.contador += 1
            }, label: {
                Text("Sumar")
            })
        }
    }
}

struct BindingUse_Previews: PreviewProvider {
    static var previews: some View {
        BindingUse()
//        BtnCounter(contador: <#Binding<Int>#>)
    }
}
