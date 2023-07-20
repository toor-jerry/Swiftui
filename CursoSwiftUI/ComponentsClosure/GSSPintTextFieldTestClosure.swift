//
//  GSSPintTextFieldTest.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 13/07/23.
//

import SwiftUI

struct GSSPintTextFieldTestClosure: View {
    
    var body: some View {
        VStack {
            Spacer()
            
            GSSPintTextFieldClosure(onPinChanged: { newPinValue in
                print("Nuevo valor del pin: \(newPinValue)")
            }, showToggle: true)
            Spacer()
        }
    }
}

struct GSSPintTextFieldTestClosure_Previews: PreviewProvider {
    static var previews: some View {
        GSSPintTextFieldTestClosure()
    }
}
