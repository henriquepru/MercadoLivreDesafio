//
//  ProductListIteractor.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 05/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

protocol ProductListIteractorOutput {
    func presentProducts(products: [Product])
    func presentError(error: Error)
}

class ProductListIteractor {
    private let service: ProductServiceType
    private let output: ProductListIteractorOutput
    
    init(service: ProductServiceType, output: ProductListIteractorOutput) {
        self.service = service
        self.output = output
    }
}

extension ProductListIteractor: ProductListViewControllerOutput {
    func searchProducts(searchString: String) {
        service.fetchProducts(with: searchString) { [weak self] result in
            switch result {
            case .success(let products):
                self?.output.presentProducts(products: products)
            case .failure(let error):
                self?.output.presentError(error: error)
            }
        }
    }
    
    func selectProductItem(itemIndex: Int) {
        
    }
}
