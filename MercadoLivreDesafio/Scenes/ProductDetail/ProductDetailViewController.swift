//
//  ProductDetailViewController.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Santos on 07/04/2019.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

protocol ProductDetailViewControllerOutput {
    func fetchProduct()
    func openProductLink()
}

class ProductDetailViewController: UIViewController {
    
    struct ViewModel {
        let productImageURL: URL
        let title: String
        let priceString: String
        let availableString: String
        let acceptsMercadopagoString: String
    }
    
    private let productImageView: UIImageView = {
        let imageView = RoundedImageView()
        imageView.image = #imageLiteral(resourceName: "empty-product")
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let availableQuantityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let acceptsMercadopagoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var openProductButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.setTitle("openProduct".localized, for: .normal)
        button.addTarget(self, action: #selector(didTapProductButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var output: ProductDetailViewControllerOutput?
    private let imageFetcher: ImageFetcher = ImageFetcherKingFisher()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductDetailViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.fetchProduct()
    }
}

extension ProductDetailViewController {
    
    private func configureLayout() {
        title = "detail".localized
        view.backgroundColor = .white
    }
    
    @objc private func didTapProductButton() {
        output?.openProductLink()
    }
}

extension ProductDetailViewController: ProductDetailPresenterOutput {
    func displayProduct(product: ProductDetailViewController.ViewModel) {
        imageFetcher.fetchImage(from: product.productImageURL, to: productImageView)
        titleLabel.text = product.title
        priceLabel.text = product.priceString
        availableQuantityLabel.text = product.availableString
        acceptsMercadopagoLabel.text = "Mercado pago: Sim"
    }
}

extension ProductDetailViewController: CodeView {
    func buildViewHierrarchy() {
        view.addSubview(productImageView)
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(availableQuantityLabel)
        view.addSubview(acceptsMercadopagoLabel)
        view.addSubview(openProductButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 80),
            productImageView.widthAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            availableQuantityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            availableQuantityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            availableQuantityLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: 2),
            
            availableQuantityLabel.widthAnchor.constraint(equalTo: priceLabel.widthAnchor),
            
            acceptsMercadopagoLabel.topAnchor.constraint(equalTo: availableQuantityLabel.bottomAnchor, constant: 32),
            acceptsMercadopagoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            acceptsMercadopagoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            openProductButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            openProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}








