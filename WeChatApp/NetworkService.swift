//
//  NetworkService.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import Foundation
import Alamofire

class NetworkService {
    
    // MARK: - Properties
    
    static let shared = NetworkService()
    
    // MARK: - Initialization
    
    private init() {}
    
    // MARK: - Public Methods
    
    func fetchProducts(completion: @escaping (Result<Models, AFError>) -> Void) {
        AF.request("https://dummyjson.com/products")
            .validate()
            .responseDecodable(of: Models.self) { response in
                completion(response.result)
            }
    }
}
