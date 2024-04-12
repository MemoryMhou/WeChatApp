//
//  ProductImageView.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import SwiftUI

struct ProductImageView: View {
    let urlString: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: urlString)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width * 0.4)
        }
    }
}

struct ViewProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ViewProductsView()
    }
}
