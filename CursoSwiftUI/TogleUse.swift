//
//  TogleUse.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 05/07/23.
//

import SwiftUI

struct TogleUse: View {

    @State var isOn: Bool = false

    var body: some View {
        Form {
            Toggle("Aceptas?", isOn: $isOn)
            Text("\(isOn.description)")
        }.navigationTitle("Toggle")
    }
}

struct TogleUse_Previews: PreviewProvider {
    static var previews: some View {
        TogleUse()
    }
}
