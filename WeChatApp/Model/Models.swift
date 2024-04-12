//
//  Models.swift
//  WeChatApp
//
//  Created by Memory Mhou on 11/04/2024.
//

import Foundation

// MARK: - Models
struct Models: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
