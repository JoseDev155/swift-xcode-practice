//
//  DishViewController.swift
//  GastronomicDictionary
//
//  Created by Jose Ramos on 23/3/26.
//

import UIKit

class DishViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    let dishes = Array(foodDictionary.keys).sorted()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }

    private func setupCollection() {
        title = "Diccionario Gastronómico"
        view.backgroundColor = .systemBackground
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.width/2) - 25, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DishViewCell.self, forCellWithReuseIdentifier: "DishViewCell")
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DishViewCell", for: indexPath) as! DishViewCell
        let name = dishes[indexPath.item]
        
        // Obtiene el detalle del diccionario para sacar el imageName
        if let detail = foodDictionary[name] {
            cell.nameLabel.text = name
            // Intenta cargar la imagen de Assets, si no existe, usa el icono por defecto
            cell.imageView.image = UIImage(named: detail.imageName) ?? UIImage(systemName: "fork.knife.circle")
        }
        
        return cell
    }
}
