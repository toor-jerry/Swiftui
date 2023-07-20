//
//  StateObjectAndObserverObjectUse.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 06/07/23.
//

import SwiftUI

final class CounterViewModel: ObservableObject {

    @Published var contador: Int = 0

    func aumentar() {
        contador += 1
    }
}

struct StateObjectAndObserverObjectUse: View {

    @State var random: Int = 0

    var body: some View {
        VStack {

            Text("Random número: \(random)")
            Button("Random") {
                random = (0..<100).randomElement()!
            }

            Divider()

            counterView()
        }
    }
}

struct counterView: View {

//    @ObservedObject var viewModel = CounterViewModel() // reinicia el valor
    @StateObject var viewModel = CounterViewModel() // se queda con el ultimo valor

    var body: some View {
        VStack {
            Text("El contador es: \(viewModel.contador)")
            Button("Aumentar") {
                viewModel.aumentar()
            }
        }
    }
}

struct StateObjectAndObserverObjectUse_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectAndObserverObjectUse()
    }
}
