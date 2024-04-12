//
//  ProductsView.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var viewModel = ProductViewModel(networkService: NetworkServiceImplemation())
    
    var body: some View {
        VStack{
            List {
                Section(header: Text("Products List").font(.headline).foregroundColor(.black)) {
                    ForEach(viewModel.products, id: \.id) { product in
                        ProductRow(product: product)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .onAppear {
            viewModel.fetchProducts()
            
        }
    }
}
