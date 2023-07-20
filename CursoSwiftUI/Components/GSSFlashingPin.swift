//
//  GSSFlashingPin.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 12/07/23.
//

import SwiftUI

struct GSSFlashingPin: View {
    @State var activeImageIndex = 1
    var size: CGFloat = 40.0
    
    let imageSwitchTimer = Timer.publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    let images = ["square", "i.square"]
    
    var body: some View {
        Image(systemName:  images[activeImageIndex])
            .font(.system(size: size, weight: .thin, design: .default))
            .onReceive(imageSwitchTimer) { _ in
                self.activeImageIndex = (self.activeImageIndex + 1) % self.images.count
            }
    }
    
    var transition: AnyTransition {
        switch activeImageIndex {
        case 0:
            return .asymmetric(insertion: .scale, removal: .opacity)
        default:
            return .identity
        }
    }
}

struct GSSFlashingPin_Previews: PreviewProvider {
    static var previews: some View {
        GSSFlashingPin()
    }
}
