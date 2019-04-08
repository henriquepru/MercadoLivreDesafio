//
//  ProductsListCoordinator.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 06/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

protocol ProductListCoordinatorDelegate {
    func didSelectProduct(product: Product)
}

class ProductListCoordinator {
    
    private let navigation: UINavigationController
    private var productListController: ProductListViewController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}

extension ProductListCoordinator: Coordinator {
    func start() {
        let controller = ProductListViewController()
        ProductListConfigurator.configure(viewController: controller, coordinatorDelegate: self)
        productListController = controller
        navigation.pushViewController(controller, animated: true)
    }
}

extension ProductListCoordinator: ProductListCoordinatorDelegate {
    func didSelectProduct(product: Product) {
        let coordinator = ProductDetailCoordinator(product: product, navigation: navigation)
        coordinator.start()
    }
}
