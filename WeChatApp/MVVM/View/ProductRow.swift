//
//  ProductRow.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    
    var body: some View {
        HStack(spacing: 0) {
            ProductImageView(urlString: product.thumbnail)
                .padding(8)
            VStack(alignment: .leading, spacing: 12) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(3)
                
                Text("Brand: \(product.brand)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text("Stock: \(product.stock)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text("Price: $\(product.price)")
                    .font(.headline)
                    .foregroundColor(.black)
            }
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(8)
        .border(Color.black)
        .frame(height: 180)
    }
}
