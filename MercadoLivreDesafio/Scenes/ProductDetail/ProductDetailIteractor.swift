//
//  ProductDetailIteractor.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Santos on 07/04/2019.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

protocol ProductDetailIteractorOutput {
    func presentProduct(product: Product)
    func presentError(error: Error)
}

class ProductDetailIteractor {
    private let output: ProductDetailIteractorOutput
    private let product: Product
    
    init(product: Product,
         output: ProductDetailIteractorOutput,
         coordinatorDelegate: ProductDetailCoordinatorDelegate) {
        self.product = product
        self.output = output
    }
}
extension ProductDetailIteractor: ProductDetailViewControllerOutput {
    func fetchProduct() {
        output.presentProduct(product: product)
    }
}
