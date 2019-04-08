//
//  ProductDetailIteractorOutpuMock.swift
//  MercadoLivreDesafioTests
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation
@testable import MercadoLivreDesafio

class ProductDetailIteractorOutputMock: ProductDetailIteractorOutput {
    
    var isPresentedError = false
    var isPresentedProduct = false
    
    func presentProduct(product: Product) {
        isPresentedProduct = true
    }
    
    func presentError(error: Error) {
        isPresentedError = true
    }
}
