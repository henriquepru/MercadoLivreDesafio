//
//  ProductListMock.swift
//  MercadoLivreDesafioTests
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation
@testable import MercadoLivreDesafio

struct ProductMock {
    static let product: Product = {
        return products[0]
    }()
    
    static let products: [Product] = {
        return  [
            Product(
                id: "MLU455327162",
                title: "Google Chromecast 3 Smart Tv Netflix Y+ Gtia 2 Años Febo",
                price: 2090,
                currencyId: "UYU",
                availableQuantity: 200,
                thumbnailURL: URL(string: "http://mlu-s1-p.mlstatic.com/918256-MLU29272818829_012019-I.jpg")!,
                acceptsMercadopago: true,
                link: URL(string: "https://articulo.mercadolibre.com.uy/MLU-455327162-google-chromecast-3-smart-tv-netflix-y-gtia-2-anos-febo-_JM")!
            ),
            Product(
                id: "MLU455015308",
                title: "Google Chromecast 3 Streaming Media Player Oferta Especial",
                price: 123.80,
                currencyId: "UYU",
                availableQuantity: 400,
                thumbnailURL: URL(string: "http://mlu-s1-p.mlstatic.com/911933-MLU29854692033_042019-I.jpg")!,
                acceptsMercadopago: true,
                link: URL(string: "https://articulo.mercadolibre.com.uy/MLU-455015308-google-chromecast-3-streaming-media-player-oferta-especial-_JM")!
            )
        ]
    }()
}

class ProductServiceMock: ProductService {
    override func fetchProducts(with searchString: String, completion: @escaping (Result<[Product]>) -> Void) {
        let products =
        completion(.success(ProductMock.products))
    }
}
