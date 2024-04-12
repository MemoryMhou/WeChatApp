//
//  ProductData.swift
//  WeChatApp
//
//  Created by Memory Mhou on 11/04/2024.
//

import Foundation

// MARK: - Models
struct ProductData: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

