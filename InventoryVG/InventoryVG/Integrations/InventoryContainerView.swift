//
//  InventoryContainerView.swift
//  InventoryVG
//
//  Created by Jose Ramos on 23/3/26.
//

//import Foundation
import SwiftUI

struct InventoryContainerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        // Envolvemos el controlador en un NavigationController para tener el título grande
        return UINavigationController(rootViewController: InventoryViewController())
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
