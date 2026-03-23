//
//  UIKitCalculatorViewController.swift
//  CalculatorApp
//
//  Created by Jose Ramos on 22/3/26.
//

import UIKit

class UIKitCalculatorViewController: UIViewController {
    let input1 = UITextField()
    let input2 = UITextField()
    let resultLabel = UILabel()
    let engine = CalculatorEngine()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .systemGroupedBackground // Fondo gris suave
        
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.spacing = 25
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Header
        let titleLabel = UILabel()
            titleLabel.text = "UIKit Calc"
            titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
            titleLabel.textAlignment = .center
            titleLabel.textColor = .label // Se adapta a modo claro/oscuro
            mainStack.addArrangedSubview(titleLabel)
        
        // Estilo de Inputs
        [input1, input2].forEach {
            $0.placeholder = "0"
            $0.textAlignment = .left
            $0.borderStyle = .none
            $0.backgroundColor = .secondarySystemBackground
            $0.layer.cornerRadius = 10
            $0.keyboardType = .decimalPad
            $0.font = .systemFont(ofSize: 20)
            // Añadir padding izquierdo manual
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
            $0.leftView = paddingView
            $0.leftViewMode = .always
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
            mainStack.addArrangedSubview($0)
        }
        
        // Resultado
        resultLabel.text = "0.00"
        resultLabel.font = .monospacedDigitSystemFont(ofSize: 50, weight: .bold)
        resultLabel.textAlignment = .center
        resultLabel.textColor = .systemIndigo
        mainStack.addArrangedSubview(resultLabel)
        
        // Estilo de Botones usando Configuration (iOS 15+)
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10
        
        let ops: [(String, UIColor)] = [("+", .systemBlue), ("-", .systemRed), ("×", .systemOrange), ("÷", .systemGreen)]
        
        for (symbol, color) in ops {
            var config = UIButton.Configuration.filled() // Botón con fondo sólido
            config.title = symbol
            config.baseBackgroundColor = color
            config.cornerStyle = .large
            
            let btn = UIButton(configuration: config)
            btn.addTarget(self, action: #selector(calculate), for: .touchUpInside)
            buttonStack.addArrangedSubview(btn)
        }
        
        mainStack.addArrangedSubview(buttonStack)
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc func calculate(_ sender: UIButton) {
        let op = sender.configuration?.title ?? ""
        resultLabel.text = engine.calculate(n1: input1.text ?? "", n2: input2.text ?? "", operation: op)
    }
}
