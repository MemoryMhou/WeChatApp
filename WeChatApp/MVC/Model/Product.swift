//
//  Product.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import Foundation

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
