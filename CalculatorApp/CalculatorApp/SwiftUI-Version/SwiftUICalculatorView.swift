//
//  SwiftUICalculatorView.swift
//  CalculatorApp
//
//  Created by Jose Ramos on 22/3/26.
//

import SwiftUI

struct SwiftUICalculatorView: View {
    @State private var num1 = ""
    @State private var num2 = ""
    @State private var result = "0.00"
    let engine = CalculatorEngine()

    var body: some View {
        VStack(spacing: 25) {
            // Header con Icono
            VStack {
                Image(systemName: "function")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                Text("SwiftUI Calculator")
                    .font(.title2.bold())
            }
            .padding(.top)

            // Inputs con estilo
            VStack(spacing: 15) {
                CustomTextField(placeholder: "Primer número", text: $num1)
                CustomTextField(placeholder: "Segundo número", text: $num2)
            }
            .padding(.horizontal)

            // Display del Resultado
            VStack {
                Text("RESULTADO")
                    .font(.caption.bold())
                    .foregroundColor(.secondary)
                Text(result)
                    .font(.system(size: 48, weight: .bold, design: .monospaced))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(15)

            // Grid de Botones
            HStack(spacing: 15) {
                OperationBtn(symbol: "+", color: .blue) { result = engine.calculate(n1: num1, n2: num2, operation: "+") }
                OperationBtn(symbol: "-", color: .red) { result = engine.calculate(n1: num1, n2: num2, operation: "-") }
                OperationBtn(symbol: "×", color: .orange) { result = engine.calculate(n1: num1, n2: num2, operation: "×") }
                OperationBtn(symbol: "÷", color: .green) { result = engine.calculate(n1: num1, n2: num2, operation: "÷") }
            }
            .padding(.bottom)
        }
        .padding(.horizontal)
    }
}

// Sub-vistas para limpieza
struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(.decimalPad)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue.opacity(0.3), lineWidth: 1))
    }
}

struct OperationBtn: View {
    let symbol: String
    let color: Color
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(symbol)
                .font(.title.bold())
                .frame(maxWidth: .infinity, minHeight: 60)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
    }
}
