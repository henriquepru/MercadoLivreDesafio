//
//  ProductListIteractorOutpuMock.swift
//  MercadoLivreDesafioTests
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation
@testable import MercadoLivreDesafio

class ProductListIteractorOutpuMock: ProductListIteractorOutput {
    
    var isPresentedError = false
    var isPresentedProducts = false
    
    func presentProducts(products: [Product]) {
        isPresentedProducts = true
    }
    
    func presentError(error: Error) {
        isPresentedError = true
    }
}
