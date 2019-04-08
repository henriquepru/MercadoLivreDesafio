//
//  ProductItemCell.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 05/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

extension ProductItemCell: ReusableView {
    struct ViewModel {
        let productImageUrl: URL
        let title: String
        let price: String
        let availableQuantity: String
    }
}

class ProductItemCell: UITableViewCell {
    
    private let productImageView: RoundedImageView = {
        let imageView = RoundedImageView()
        imageView.image = #imageLiteral(resourceName: "empty-product")
        imageView.backgroundColor = UIColor.lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let availableQuantityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageFetcher = ImageFetcherKingFisher()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductItemCell {
    func setup(viewMode: ViewModel) {
        imageFetcher.fetchImage(from: viewMode.productImageUrl, to: productImageView)
        titleLabel.text = viewMode.title
        priceLabel.text = viewMode.price
        availableQuantityLabel.text = viewMode.availableQuantity
    }
}

extension ProductItemCell: CodeView {
    func buildViewHierrarchy() {
        self.addSubview(productImageView)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
        self.addSubview(availableQuantityLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            productImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 60),
            productImageView.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: productImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            priceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: productImageView.trailingAnchor, constant: 8),
            
            availableQuantityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            availableQuantityLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8),
            availableQuantityLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8)
        ])
    }
}
