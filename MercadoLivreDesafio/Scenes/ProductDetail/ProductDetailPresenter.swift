//
//  ProductDetailPresenter.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Santos on 07/04/2019.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

protocol ProductDetailPresenterOutput: class {
    func displayProduct(product: ProductDetailViewController.ViewModel)
}

class ProductDetailPresenter {
    private weak var output: ProductDetailPresenterOutput?
    private typealias ViewModel = ProductDetailViewController.ViewModel
    
    init(output: ProductDetailPresenterOutput) {
        self.output = output
    }
}

extension ProductDetailPresenter: ProductDetailIteractorOutput {
    func presentProduct(product: Product) {
        output?.displayProduct(product: ViewModel(
            productImageURL: product.thumbnailURL,
            title: product.title,
            priceString: String(format: "\(product.currencyId) %.02f", product.price),
            availableString: "\(product.availableQuantity) " + "available".localized))
    }
    
    func presentError(error: Error) {
        fatalError("Trying to open product details without product")
    }
}
