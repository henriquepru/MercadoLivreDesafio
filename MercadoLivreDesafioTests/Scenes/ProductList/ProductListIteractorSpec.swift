//
//  ProductListIteractorSpec.swift
//  MercadoLivreDesafioTests
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import MercadoLivreDesafio

class ProductListIteractorSpec: QuickSpec {
    
    override func spec() {
        var sut: ProductListIteractor!
        let productService = ProductServiceMock()
        let output = ProductListIteractorOutpuMock()
        let coordinatorDelegateMock = ProductListCoordinatorMock()
        
        beforeEach {
            sut = ProductListIteractor(
                service: productService,
                output: output,
                coordinatorDelegate: coordinatorDelegateMock
            )
        }
        
        describe("the 'ProductListIteractor'") {
            context("when Iteractor is created") {
                it("not be nil") {
                    expect(sut).toNot(beNil())
                }
            }
            context("when searchProducts is called") {
                it("output presentProducts is called") {
                    expect(output.isPresentedProducts).to(beFalse())
                    sut.searchProducts(searchString: "")
                    expect(output.isPresentedProducts).to(beTrue())
                }
            }
            context("when selectProductItem  is called") {
                it("coordinatorDelegate didSelectProduct is called") {
                    sut.searchProducts(searchString: "")
                    expect(coordinatorDelegateMock.callDidselectProduct).to(beFalse())
                    sut.selectProductItem(itemIndex: 0)
                    expect(coordinatorDelegateMock.callDidselectProduct).to(beTrue())
                }
            }
        }
    }
}
