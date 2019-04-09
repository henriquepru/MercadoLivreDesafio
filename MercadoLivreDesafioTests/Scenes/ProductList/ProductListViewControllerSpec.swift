//
//  ProductListViewControllerSpec.swift
//  MercadoLivreDesafioTests
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation
import Quick
import FBSnapshotTestCase
@testable import MercadoLivreDesafio

class ProductListViewControllerSpec: FBSnapshotTestCase {
    var sut: ProductListViewController!
    var presenter: ProductListPresenter!
    
    override func setUp() {
        super.setUp()
        sut = ProductListViewController()
        presenter = ProductListPresenter(output: sut)
        let _ = sut.view
    }
    
    func testProductListViewControllerHaveTheExpectedLayoutWithoutData() {
        FBSnapshotVerifyView(sut.view)
    }
}
