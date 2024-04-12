//
//  ProductsViewController.swift
//  WeChatApp
//
//  Created by Memory Mhou on 11/04/2024.
//

import UIKit
import Alamofire
import AlamofireImage

class ProductsViewController: UIViewController {

    // MARK: - Properties
    
    private var products: [Product] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductCell")
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TitleCell")
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        return table
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchProducts()
    }

    // MARK: - Private Methods
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    private func fetchProducts() {
        NetworkService.shared.fetchProducts { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.products = model.products
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension ProductsViewController: UITableViewDataSource {
    
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

extension ProductsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 50 : 230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
}
