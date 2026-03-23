//
//  GameDetail.swift
//  InventoryVG
//
//  Created by Jose Ramos on 23/3/26.
//

import Foundation

// Modelo para Videojuegos
struct Game {
    let genre: String
    let releaseYear: Int
    let platform: String
}

// Datos iniciales de inventario
let myGames: [String: Game] = [
    "The Legend of Zelda": Game(genre: "Aventura", releaseYear: 2017, platform: "Nintendo Switch"),
    "Elden Ring": Game(genre: "Accion RPG", releaseYear: 2022, platform: "PS5/Xbox/PC"),
    "Halo Infinite": Game(genre: "Shooter", releaseYear: 2021, platform: "Xbox/PC"),
    "God of War": Game(genre: "Accion", releaseYear: 2018, platform: "PS4/PC")
]
