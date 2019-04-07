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

//
//protocol ProductListPresenterOutput: class {
//    func displayProducts(products: [ProductItemCell.ViewModel])
//    func displayError(errorMessage: String)
//}
//
//struct ProductListPresenter {
//    private weak var output: ProductListPresenterOutput?
//    private typealias ViewModel = ProductItemCell.ViewModel
//
//    init(output: ProductListPresenterOutput) {
//        self.output = output
//    }
//}
//
//extension ProductListPresenter: ProductListIteractorOutput {
//
//    func presentProducts(products: [Product]) {
//        output?.displayProducts(products: products.map {
//            ViewModel(
//                productImageUrl: $0.thumbnailURL,
//                title: $0.title,
//                price: String(format: "\($0.currencyId) %.02f", $0.price),
//                availableQuantity: "\($0.availableQuantity) " + "available".localized)
//        })
//    }
//
//    func presentError(error: Error) {
//        output?.displayError(errorMessage: error.localizedDescription)
//    }
//}
