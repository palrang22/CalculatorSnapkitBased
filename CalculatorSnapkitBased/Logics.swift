//
//  Logics.swift
//  CalculatorSnapkitBased
//
//  Created by 김승희 on 6/24/24.
//

import Foundation

class Logics {
    var currentNumLabel = ""
    
    func tapButton(_ label: String) -> String {
        switch label {
        case "0":
            if currentNumLabel == "0" {
            } else {
                currentNumLabel += "0"
            }
        case "AC":
            currentNumLabel = "0"
            
        case "=":
            if let currentnumlabel = calculate(expression: currentNumLabel) {
                currentNumLabel = String(currentnumlabel)
            } else {
                currentNumLabel = "Error"
            }
        default:
            if currentNumLabel == "0" {
                currentNumLabel = "\(label)"
            } else {
                currentNumLabel += "\(label)"
            }
        }
        
        return currentNumLabel
    }
    
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}
