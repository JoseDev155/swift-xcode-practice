//
//  CalculatorEngine.swift
//  CalculatorApp
//
//  Created by Jose Ramos on 22/3/26.
//

import Foundation

// Funciiones de Calculadora
struct CalculatorEngine {
    func calculate(n1: String, n2: String, operation: String) -> String {
        guard let num1 = Double(n1), let num2 = Double(n2) else { return "Error" }
        
        switch operation {
        case "+": return String(format: "%.2f", num1 + num2)
        case "-": return String(format: "%.2f", num1 - num2)
        case "×": return String(format: "%.2f", num1 * num2)
        case "÷": return num2 != 0 ? String(format: "%.2f", num1 / num2) : "Div/0" // "No se puede dividir por cero."
        default: return "0"
        }
    }
}
