//
//  Int+Extension.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 13/07/23.
//

extension Int {
    var numberString: String {
        guard self < 10 else { return "0"}
        return String(self)
    }
}
