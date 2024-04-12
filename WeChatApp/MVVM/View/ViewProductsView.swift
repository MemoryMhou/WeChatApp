//
//  ViewProductsView.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import SwiftUI

struct ViewProductsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                NavigationLink(destination: ProductsView()) {
                    Text("View Products")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 5)
                }
                
                Spacer()
            }
        }
    }
}


