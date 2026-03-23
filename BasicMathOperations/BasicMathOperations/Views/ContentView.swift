//
//  ContentView.swift
//  BasicMathOperations
//
//  Created by Jose Ramos on 22/3/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Entrada de Datos")) {
                    TextField("Primer número", text: $viewModel.number1)
                        .keyboardType(.decimalPad)
                    TextField("Segundo número", text: $viewModel.number2)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Operaciones")) {
                    HStack(spacing: 20) {
                        OperationButton(title: "+", color: .blue) { viewModel.calculate(.add) }
                        OperationButton(title: "-", color: .red) { viewModel.calculate(.subtract) }
                        OperationButton(title: "×", color: .orange) { viewModel.calculate(.multiply) }
                        OperationButton(title: "÷", color: .green) { viewModel.calculate(.divide) }
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Calculadora Básica")
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Resultado"),
                    message: Text(viewModel.resultMessage),
                    dismissButton: .default(Text("Aceptar"))
                )
            }
        }
    }
}

// Componente de boton personalizado
struct OperationButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title.bold())
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(color)
                .clipShape(Circle())
                .shadow(radius: 3)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
