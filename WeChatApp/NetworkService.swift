//
//  NetworkService.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import Foundation
import Alamofire

protocol NetworkService {
    func fetchProducts(productUrl: String, completion: @escaping (Result<ProductData, AFError>) -> Void)
}

class NetworkServiceImplemation: NetworkService {
    func fetchProducts(productUrl: String, completion: @escaping (Result<ProductData, AFError>) -> Void) {
        AF.request(productUrl)
            .validate()
            .responseDecodable(of: ProductData.self) { response in
                completion(response.result)
            }
    }
}
