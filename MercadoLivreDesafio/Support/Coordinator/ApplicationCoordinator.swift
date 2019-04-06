//
//  ApplicationCoordinator.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 06/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

struct ApplicationCoordinator: Coordinator {
    
    private let window: UIWindow
    private let rootController: UINavigationController
    private let productListCoordinator: ProductListCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootController = ApplicationCoordinator.customNavigationController()
        productListCoordinator = ProductListCoordinator(navigation: rootController)
    }
}

extension ApplicationCoordinator {
    func start() {
        window.rootViewController = rootController
        window.makeKeyAndVisible()
        productListCoordinator.start()
    }
}

extension ApplicationCoordinator {
    private static func customNavigationController() -> UINavigationController {
        let navigation = UINavigationController()
        return navigation
    }
}
