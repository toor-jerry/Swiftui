//
//  PintTextField.swift
//  CursoSwiftUI
//
//  Created by 1019407 on 11/07/23.
//

import SwiftUI

struct GSSPintTextFieldClosure: View {
    
    @State var pin: String = ""
    @State var isVisible: Bool = true

    var onPinChanged: ((String) -> Void)?
    var showToggle: Bool = true
    
    var digits: Int = 4
    var sizePin: CGFloat = 40.0
    
    private let image: String = "square"
    private let imageFill: String = "dot.square"
    private let imagePointer: String = "i.square"
    
    
    var body: some View {
        VStack{
            ZStack {
                fieldPin
                textPin
            }

            if showToggle {
                GSSToggleShowPinClosure(isVisible: $isVisible)
            }
        }
    }
    
    private var fieldPin: some View {
        HStack {
            Spacer()

            ForEach(.zero..<digits) { index in
                
                if getImg(index) == imagePointer {

                    GSSFlashingPin(size: sizePin)
                } else {
                    
                    Image(systemName: getImg(index) )
                        .renderingMode(.template)
                        .font(.system(size: sizePin, weight: .thin, design: .default))
                        .foregroundColor(getColorField(index))
                }
                
                Spacer()
                
            }
        }
    }
    
    private var textPin: some View {
        
        let textPin = Binding<String>( get: {
            self.pin
        }, set: { newValue in
            setNewValue(newValue)
        })
        
        return TextField("", text: textPin)
            .accentColor(.clear)
            .foregroundColor(.clear)
            .keyboardType(.numberPad)
    }
    
    private func getImg(_ index: Int) -> String {
        
        if index >= self.pin.count {
            
            if index == .zero || self.pin.count == index {
                return imagePointer
            }
            
            return image
        }
        
        
        return getNumberOrCircle(index)
    }
    
    private func getColorField(_ index: Int) -> Color {
        
        return getFieldText(index).isEmpty ? .black: .purple
    }
    
    private func getNumberOrCircle(_ index: Int) -> String {
        
        let textInField: String = getFieldText(index)
        
        if isVisible {
            
            return textInField.isEmpty ? image : textInField + "." + image
            
        } else {
            
            return imageFill
        }
    }
    
    private func getFieldText(_ index: Int) -> String {
        return self.pin.digits[safe: index]?.numberString ?? ""
    }


    private func setNewValue(_ newValue: String) {

        if newValue.count <= digits,
           let _ = Int(newValue) {
            pin = newValue

            if newValue.count >= digits {
                onPinChanged?(newValue)
            }
        }

        if newValue.isEmpty {
            pin = ""
        }
    }
}
