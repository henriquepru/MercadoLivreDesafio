//
//  ProductListIteractorPresenter.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 05/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

protocol ProductListPresenterOutput: class {
    func displayProducts(products: [ProductItemCell.ViewModel])
    func displayError(errorMessage: String)
}

struct ProductListPresenter {
    private weak var output: ProductListPresenterOutput?
    private typealias ViewModel = ProductItemCell.ViewModel
    
    init(output: ProductListPresenterOutput) {
        self.output = output
    }
}

extension ProductListPresenter: ProductListIteractorOutput {
    
    func presentProducts(products: [Product]) {
        output?.displayProducts(products: products.map {
            ViewModel(
                productImageUrl: $0.thumbnailURL,
                title: $0.title,
                price: " \($0.currencyId) \($0.price)",
                availableQuantity: "\($0.availableQuantity)")
        })
    }
    
    func presentError(error: Error) {
        output?.displayError(errorMessage: error.localizedDescription)
    }
}
