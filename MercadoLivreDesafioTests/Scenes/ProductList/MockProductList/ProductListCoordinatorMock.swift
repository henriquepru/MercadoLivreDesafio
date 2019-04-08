//
//  ProductListCoordinatorMock.swift
//  MercadoLivreDesafioTests
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation
@testable import MercadoLivreDesafio

class ProductListCoordinatorMock: ProductListCoordinatorDelegate {
    
    var callDidselectProduct = false
    
    func didSelectProduct(product: Product) {
        callDidselectProduct = true
    }
}
