//
//  ProductListIteractorPresenter.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 05/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

protocol ProductListPresenterOutput: class {
    func displayProducts(products: [Product]) //warning: Add ProductCellViewModel
    func displayError(errorMessage: String)
}

struct ProductListPresenter {
    private weak var output: ProductListPresenterOutput?
    
    init(output: ProductListPresenterOutput) {
        self.output = output
    }
}

extension ProductListPresenter: ProductListIteractorOutput {
    
    func presentProducts(products: [Product]) {
        
        
    }
    
    func presentError(error: Error) {
        
    }
}
