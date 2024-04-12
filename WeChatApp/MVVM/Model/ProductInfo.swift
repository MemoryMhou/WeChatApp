//
//  ProductInfo.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import Foundation


// MARK: - Models
struct ProductInfo: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

