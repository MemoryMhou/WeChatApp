//
//  ViewController.swift
//  WeChatApp
//
//  Created by Memory Mhou on 11/04/2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("View Products", for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc private func didTapButton() {
        let productsViewController = ProductsViewController()
        navigationController?.pushViewController(productsViewController, animated: true)
    }
}
