//
//  String+Extension.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 13/07/23.
//

extension String {
    
    var digits: [Int] {
        var result = [Int]()
        
        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }
        return result
    }
}
