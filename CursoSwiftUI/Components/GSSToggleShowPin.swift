//
//  GSSToggleShowPin.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 13/07/23.
//

import SwiftUI

struct GSSToggleShowPin: View {
    @Binding var isVisible: Bool
    
    private var textShow: String {
        if isVisible {
            return "Mostrar"
        } else {
            return "Ocultar"
        }
    }
    var body: some View {
        Toggle(textShow, isOn: $isVisible)
            .padding(50)
    }
}

struct GSSToggleShowPin_Previews: PreviewProvider {
    @State static var isVisible: Bool = true
    
    static var previews: some View {
        GSSToggleShowPin(isVisible: $isVisible)
    }
}
