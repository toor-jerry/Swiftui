//
//  DragGestureUse.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 06/07/23.
//

import SwiftUI

struct DragGestureUse: View {

    @State var move: CGSize = .zero

    var body: some View {
        Circle()
        .frame(width: 100)
        .offset(x: move.width, y: move.height)
        .gesture(DragGesture().onChanged({ value in
            move = value.translation
        })
            .onEnded({ _ in
                withAnimation(.spring()) {
                    move = .zero
                }
            }))
    }
}

struct DragGestureUse_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureUse()
    }
}
