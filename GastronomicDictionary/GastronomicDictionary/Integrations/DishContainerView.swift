//
//  DishContainerView.swift
//  GastronomicDictionary
//
//  Created by Jose Ramos on 23/3/26.
//

import SwiftUI

struct DishContainerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        return UINavigationController(rootViewController: DishViewController())
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
