//
//  ProductDetailIteractorSpec.swift
//  MercadoLivreDesafioTests
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MercadoLivreDesafio

class ProductDetailIteractorSpec: QuickSpec {
    
    override func spec() {
        var sut: ProductDetailIteractor!
        let output = ProductDetailIteractorOutputMock()
        let coordinatorDelegateMock = ProductDetailCoordinatorMock()
        
        beforeEach {
            sut = ProductDetailIteractor(
                product: ProductMock.product,
                output: output,
                coordinatorDelegate: coordinatorDelegateMock
            )
        }
        describe("the 'ProductDetailIteractor'") {
            context("when Iteractor is created") {
                it("not be nil") {
                    expect(sut).toNot(beNil())
                }
            }
            context("when fetchProduct is called") {
                it("output presentProduct is called") {
                    expect(output.isPresentedProduct).to(beFalse())
                    sut.fetchProduct()
                    expect(output.isPresentedProduct).to(beTrue())
                }
            }
        }
    }
}
