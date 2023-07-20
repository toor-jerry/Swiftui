//
//  StateUSe.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 05/07/23.
//

import SwiftUI

struct StateUSe: View {

    @State var contador: Int = 0
    @State var contador2: Int = 0

    var body: some View {
        VStack {
            Text("Contador: \(contador)")
                .font(.system(size: 30, weight: .bold))
                .padding(5)
            Button(action: {
                self.contador += 1
            }, label: {
                Text("Sumar")
            })

            Spacer()
            Button(action: {
                self.contador2 += 1
            }, label: {
                Text("Sumar")
            })
            Text("\(contador2)")
                .font(.largeTitle)
        }
    }
}

struct StateUSe_Previews: PreviewProvider {
    static var previews: some View {
        StateUSe()
    }
}
