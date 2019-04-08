//
//  ProductDetailCoordinator.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Santos on 07/04/2019.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

protocol ProductDetailCoordinatorDelegate {}

class ProductDetailCoordinator: Coordinator {
    private let navigation: UINavigationController
    private var productDeatilController: ProductDetailViewController?
    private let product: Product
    
    init(product: Product, navigation: UINavigationController) {
        self.navigation = navigation
        self.product = product
    }
}

extension ProductDetailCoordinator: ProductDetailCoordinatorDelegate {
    func start() {
        let controller = ProductDetailViewController()
        ProductDetailConfigurator.configure(product: product,
                                            viewController: controller,
                                            coordinatorDelegate: self)
        productDeatilController = controller
        navigation.pushViewController(controller, animated: true)
    }
}
