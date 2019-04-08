//
//  ProductListPresenterOutputMock.swift
//  MercadoLivreDesafioTests
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation
@testable import MercadoLivreDesafio

class ProductListPresenterOutputMock: ProductListPresenterOutput {
    
    var isDisplayedError = false
    var isDisplayedProducts = false
    var displayedProduct: [ProductItemCell.ViewModel]?
    
    func displayError(errorMessage: String) {
        isDisplayedError = true
    }
    func displayProducts(products: [ProductItemCell.ViewModel]) {
        displayedProduct = products
        isDisplayedProducts = true
    }
}


