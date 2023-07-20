//
//  StepperUse.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 05/07/23.
//

import SwiftUI

struct StepperUse: View {

    @State var num: Int = 0
    @State var num2: Int = 0

    var body: some View {
        VStack {
            Form {
                Stepper("Iphone \(num)", value: $num, in: 0...5, step: 2)
                Stepper("Iphone \(num2)")
                {
                    num2 += 1
                } onDecrement: {
                    num2 -= 1
                }
            }.navigationTitle("Stepper")
        }
    }
}

struct StepperUse_Previews: PreviewProvider {
    static var previews: some View {
        StepperUse()
    }
}
