//
//  ProductsViewController.swift
//  WeChatApp
//
//  Created by Memory Mhou on 11/04/2024.
//

import UIKit

class ProductsViewController: UIViewController {

    // MARK: - Properties
    let productUrl: String = "https://dummyjson.com/products"
    private var products: [Product] = []
    private let networkService: NetworkService = NetworkServiceImplemation()
    
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
        networkService.fetchProducts(productUrl: productUrl) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.products = data.products
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
    return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
            let product = products[indexPath.row]
            cell.configure(with: product)
            return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
      return "Products List"
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let titleView = view as? UITableViewHeaderFooterView {
            titleView.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        }
    }
}

// MARK: - UITableViewDelegate

extension ProductsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
