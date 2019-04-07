//
//  ProductDetailViewController.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Santos on 07/04/2019.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    struct ViewModel {
        let productImageURL: URL
        let title: String
        let priceString: String
        let availableString: String
    }
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "empty-product")
        imageView.backgroundColor = UIColor.lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let availableQuantityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension ProductDetailViewController: CodeView {
    func buildViewHierrarchy() {
        view.addSubview(productImageView)
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(availableQuantityLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
            
            availableQuantityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            availableQuantityLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: 2),
            
            availableQuantityLabel.widthAnchor.constraint(equalTo: priceLabel.widthAnchor)
        ])
    }
}








