//
//  TextFieldUse.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 04/07/23.
//

import SwiftUI

struct TextFieldUse: View {

    @State var userName: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            Form {
                TextField("User name", text: $userName)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .padding(10)
                    .font(.headline)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                    .padding(.horizontal, 60)
                    .padding(.top, 0)
                    .onChange(of: userName, perform: { text in
                        print(text)
                    })

                SecureField("Password", text: $password)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .padding(10)
                    .font(.headline)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                    .padding(.horizontal, 60)
                    .padding(.top, 0)
                    .onChange(of: password, perform: { text in
                        print(text)
                    })

                Button(action: {

                }, label: {
                    Text("Enviar")
                })
            }

            Spacer()
        }
    }
}

struct TextFieldUse_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldUse()
    }
}
