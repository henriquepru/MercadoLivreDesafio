//
//  ProductListConfigurator.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 06/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

struct ProductListConfigurator {
    
    private init() {}
    
    static func configure(viewController: ProductListViewController,
                          coordinatorDelegate: ProductListCoordinatorDelegate) {
        
        let service = ProductService()
        let presenter = ProductListPresenter(output: viewController)
        let iteractor = ProductListIteractor(service: service,
                                             output: presenter,
                                             coordinatorDelegate: coordinatorDelegate)
        viewController.output = iteractor
    }
}
