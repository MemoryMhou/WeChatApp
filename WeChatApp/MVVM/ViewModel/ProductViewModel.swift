//
//  ProductViewModel.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import Foundation
class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchProducts() {
        
        networkService.fetchProducts(productUrl: "https://dummyjson.com/products") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.products = data.products
            case .failure(let error):
                print(error)
            }
        }
    }
}
