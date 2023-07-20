//
//  GSSPintTextFieldTest.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 13/07/23.
//

import SwiftUI

struct GSSPintTextFieldTest: View {
    @State var text: String = ""
    @State var isCompleted: Bool = false
    @State var isVisible: Bool = true
    
    var body: some View {
        VStack {
            Text("Pin text: \(text)")
                .foregroundColor(.blue)
                .font(.system(size: 25))
                .padding(EdgeInsets(top: 140, leading: 0, bottom: 0, trailing: 0))
            HStack {
                Text("Is completed:")
                    .font(.system(size: 25))
                Text(isCompleted.description)
                    .font(.system(size: 25 ,weight: .bold))
                    .foregroundColor(isCompleted ? .green : .red)
            }

            Spacer()
            
            GSSPintTextField(isCompleted: $isCompleted, pin: $text, isVisible: $isVisible, digits: 4)
            GSSToggleShowPin(isVisible: $isVisible)
            Spacer()
        }
    }
}

struct GSSPintTextFieldTest_Previews: PreviewProvider {
    static var previews: some View {
        GSSPintTextFieldTest()
    }
}
