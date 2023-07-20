//
//  ContexMenuUse.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 06/07/23.
//

import SwiftUI

struct ContexMenuUse: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .contextMenu(menuItems: {
                    Button(action: {
                        print("Click")
                    }, label: {
                        Label("Comprar", systemImage: "cart.badge.plus")
                    })

                    Button(action: {
                        print("Click 2")
                    }, label: {
                        Label("Teclado", systemImage: "keyboard")
                    })

                    Divider()

                    Button(role: .destructive, action: {
                        print("Click 3")
                    }, label: {
                        Label("Eliminar", systemImage: "trash")
                            .foregroundColor(.red)
                    })
                })
        }
    }
}

struct ContexMenuUse_Previews: PreviewProvider {
    static var previews: some View {
        ContexMenuUse()
    }
}
