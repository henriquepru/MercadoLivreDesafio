//
//  ProductDetailPresenterSpec.swift
//  MercadoLivreDesafioTests
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MercadoLivreDesafio

class ProductDetailPresenterSpec: QuickSpec {
    
    override func spec() {
        var sut: ProductDetailPresenter!
        var output: ProductDetailPresenterOutputMock!
        
        beforeEach {
            output = ProductDetailPresenterOutputMock()
            sut = ProductDetailPresenter(output: output)
        }
        
        describe("the 'ProductDetailPresenter'") {
            context("when Presenter is created") {
                it("not be nil") {
                    expect(sut).toNot(beNil())
                }
            }
            
            context("when presentProduct is called") {
                it("display product must be called") {
                    
                    expect(output.isDisplayedProduct).to(beFalse())
                    sut.presentProduct(product: ProductMock.product)
                    expect(output.isDisplayedProduct).to(beTrue())
                }
                it("the viewmodel is created") {
                    
                    expect(output.displayedProduct).to(beNil())
                    sut.presentProduct(product: ProductMock.product)
                    expect(output.displayedProduct).toNot(beNil())
                }
                
                it("the viewmodel title is correct") {
                    let product = Product(
                        id: "123",
                        title: "Titulo do produto",
                        price: 100,
                        currencyId: "R$",
                        availableQuantity: 200,
                        thumbnailURL: URL(string: "http://mlu-s1-p.mlstatic.com/918256-MLU29272818829_012019-I.jpg")!,
                        acceptsMercadopago: true,
                        link: URL(string: "https://www.google.com")!)
                    
                    expect(output.displayedProduct).to(beNil())
                    sut.presentProduct(product: product)
                    expect(output.displayedProduct?.title).to(equal("Titulo do produto"))
                    expect(output.displayedProduct?.priceString).to(equal("R$ 100.00"))
                }
            }
        }
    }
}
