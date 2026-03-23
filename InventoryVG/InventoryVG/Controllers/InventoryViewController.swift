//
//  InventoryViewController.swift
//  InventoryVG
//
//  Created by Jose Ramos on 23/3/26.
//

//import Foundation
import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    // Convertir las llaves del diccionario en un arreglo para que la tabla pueda iterarlas
    private let gameNames = Array(myGames.keys).sorted()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "InventoryVG App"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        // Configurar Tabla
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Estilo "subtitle" para mostrar el nombre y un detalle rápido
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let name = gameNames[indexPath.row]
        
        cell.textLabel?.text = name
        cell.textLabel?.font = .boldSystemFont(ofSize: 18)
        
        if let details = myGames[name] {
            cell.detailTextLabel?.text = "\(details.genre) • \(details.releaseYear)"
            cell.detailTextLabel?.textColor = .secondaryLabel
        }
        
        cell.accessoryType = .disclosureIndicator // Flechita clásica de iOS
        return cell
    }

    // MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let name = gameNames[indexPath.row]
        guard let details = myGames[name] else { return }
        
        // Cuadro de diálogo con los detalles del Diccionario
        let alert = UIAlertController(
            title: name,
            message: "Plataforma: \(details.platform)\nGénero: \(details.genre)\nAño: \(details.releaseYear)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cerrar", style: .default))
        present(alert, animated: true)
    }
}
