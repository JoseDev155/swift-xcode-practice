//
//  CalculatorViewModel.swift
//  BasicMathOperations
//
//  Created by Jose Ramos on 22/3/26.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var number1: String = ""
    @Published var number2: String = ""
    @Published var resultMessage: String = ""
    @Published var showAlert: Bool = false
    
    func calculate(_ operation: Operation) {
        // Validar que los campos no estén vacíos y sean números
        guard let n1 = Double(number1), let n2 = Double(number2) else {
            resultMessage = "Por favor, ingresa números válidos."
            showAlert = true
            return
        }
        
        var result: Double = 0
        
        switch operation {
        case .add: result = n1 + n2
        case .subtract: result = n1 - n2
        case .multiply: result = n1 * n2
        case .divide:
            if n2 == 0 {
                resultMessage = "No se puede dividir por cero."
                showAlert = true
                return
            }
            result = n1 / n2
        }
        
        // Formater el resultado para quitar decimales innecesarios
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        let resultString = formatter.string(from: NSNumber(value: result)) ?? "\(result)"
        
        resultMessage = "El resultado es: \(resultString)"
        showAlert = true
    }
    
    enum Operation {
        case add, subtract, multiply, divide
    }
}
