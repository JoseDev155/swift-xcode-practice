//
//  Dish.swift
//  GastronomicDictionary
//
//  Created by Jose Ramos on 23/3/26.
//

import Foundation

struct Dish {
    let description: String
    let origin: String
    let imageName: String // Nombre del archivo en Assets.xcassets
}

let foodDictionary: [String: Dish] = [
    "Paella": Dish(description: "Arroz con mariscos y azafrán.", origin: "España", imageName: "paella"),
    "Sushi": Dish(description: "Arroz avinagrado con pescado crudo.", origin: "Japón", imageName: "sushi"),
    "Tacos": Dish(description: "Tortilla de maíz rellena de carne.", origin: "México", imageName: "tacos"),
    "Pizza": Dish(description: "Masa horneada con tomate y queso.", origin: "Italia", imageName: "pizza")
]
