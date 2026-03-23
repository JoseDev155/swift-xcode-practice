//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Jose Ramos on 22/3/26.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        // Escoger alguna de las vistas
        
        // 2.1 SwiftUI
        //SwiftUICalculatorView()
        
        // 2.2 UIKit
        UIKitView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Funciones para convertir un controlador de UIKit en una vista de SwiftUI
struct UIKitView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIKitCalculatorViewController {
        return UIKitCalculatorViewController()
    }
    func updateUIViewController(_ uiViewController: UIKitCalculatorViewController, context: Context) {}
}
