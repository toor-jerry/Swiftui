//
//  Array+Extension.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 13/07/23.
//

extension Array {
    subscript (safe index: Int) -> Element? {
        return (index < count && index >= 0) ? self[index] : nil
    }
}
