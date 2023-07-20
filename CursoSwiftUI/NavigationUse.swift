//
//  NavigationUse.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 05/07/23.
//

import SwiftUI

struct NavigationUse: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Pantalla Toggle", destination: TogleUse())
                NavigationLink("Pantalla Stepper", destination: StepperUse())
                NavigationLink(destination: StepperUse(), label: {
                    Btn2View()
                })
            }.toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done", action: {
                        print("Hola")
                    })
                }
            }).navigationTitle("Navegación")
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct NavigationUse_Previews: PreviewProvider {
    static var previews: some View {
        NavigationUse()
    }
}
