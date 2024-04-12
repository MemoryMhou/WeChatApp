//
//  ProductView.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import UIKit

protocol ProductViewDelegate: AnyObject {
    func didSelectProduct(_ product: Product)
}

class ProductView: UIView {
    
    // MARK: - Properties
    
    private var products: [Product] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductCell")
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TitleCell")
        table.separatorStyle = .none
        return table
    }()
    
    weak var delegate: ProductViewDelegate?

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        tableView.frame = bounds
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func updateProducts(_ products: [Product]) {
        self.products = products
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ProductView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath)
            cell.textLabel?.text = "Products List"
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
            let product = products[indexPath.row - 1]
            cell.configure(with: product)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension ProductView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 50 : 230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row != 0 {
            let product = products[indexPath.row - 1]
            delegate?.didSelectProduct(product)
        }
    }
}
