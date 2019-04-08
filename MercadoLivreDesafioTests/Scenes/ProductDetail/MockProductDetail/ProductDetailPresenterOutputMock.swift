//
//  ProductDetailPresenterOutputMock.swift
//  MercadoLivreDesafioTests
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation
@testable import MercadoLivreDesafio

class ProductDetailPresenterOutputMock: ProductDetailPresenterOutput {
    
    var isDisplayedProduct = false
    var displayedProduct: ProductDetailViewController.ViewModel?
    
    func displayProduct(product: ProductDetailViewController.ViewModel) {
        displayedProduct = product
        isDisplayedProduct = true
    }
}
