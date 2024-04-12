//
//  ProductTableViewCell.swift
//  WeChatApp
//
//  Created by Memory Mhou on 12/04/2024.
//

import UIKit
import Alamofire
import AlamofireImage

class ProductTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageSize = UIScreen.main.bounds.width * 0.4
        imageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stockLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(productImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(brandLabel)
        containerView.addSubview(stockLabel)
        containerView.addSubview(priceLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            productImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            productImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            productImageView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -10),
            
            titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: productImageView.topAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 60),
            
            brandLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            brandLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            
            stockLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            stockLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 10),
            
            priceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            priceLabel.topAnchor.constraint(equalTo: stockLabel.bottomAnchor, constant: 10),
        ])
    }
    
    // MARK: - Public Methods
    
    func configure(with product: Product) {
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        brandLabel.text = "Brand: \(product.brand)"
        stockLabel.text = "Stock: \(product.stock)"
        priceLabel.text = "Price: $\(product.price)"
        
        if let url = URL(string: product.thumbnail) {
            productImageView.af.setImage(withURL: url)
        }
    }
}
