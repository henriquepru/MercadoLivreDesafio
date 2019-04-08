//
//  ProductDetailConfigurator.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Santos on 07/04/2019.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

struct ProductDetailConfigurator {
    
    private init() {}
    
    static func configure(product: Product,
                          viewController: ProductDetailViewController,
                          coordinatorDelegate: ProductDetailCoordinatorDelegate) {
        
        let presenter = ProductDetailPresenter(output: viewController)
        let iteractor = ProductDetailIteractor(product: product,
                                               output: presenter,
                                               coordinatorDelegate: coordinatorDelegate)
        viewController.output = iteractor
    }
}

