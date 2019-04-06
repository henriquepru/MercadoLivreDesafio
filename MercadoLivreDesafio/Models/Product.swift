//
//  Product.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 04/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

struct ProductApiResponse {
    let products: [Product]
}

extension ProductApiResponse: Decodable {
    
    private enum ProductApiResponseCodingKeys: String, CodingKey {
        case products = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProductApiResponseCodingKeys.self)
        products = try container.decode([Product].self, forKey: .products)
    }
}

struct Product {
    let id: String
    let title: String
    let price: Double
    let currencyId: String
    let availableQuantity: Int
    let thumbnailURL: URL
    let acceptsMercadopago: Bool
}

extension Product: Decodable {
    
    enum ProductCodingKeys: String, CodingKey {
        case id
        case title
        case price
        case currencyId = "currency_id"
        case availableQuantity = "available_quantity"
        case thumbnailURL = "thumbnail"
        case acceptsMercadopago = "accepts_mercadopago"
    }
    
    init(from decoder: Decoder) throws {
        let productContainer = try decoder.container(keyedBy: ProductCodingKeys.self)
        
        id = try productContainer.decode(String.self, forKey: .id)
        title = try productContainer.decode(String.self, forKey: .title)
        price = try productContainer.decode(Double.self, forKey: .price)
        currencyId = try productContainer.decode(String.self, forKey: .currencyId)
        availableQuantity = try productContainer.decode(Int.self, forKey: .availableQuantity)
        thumbnailURL = try productContainer.decode(URL.self, forKey: .thumbnailURL)
        acceptsMercadopago = try productContainer.decode(Bool.self, forKey: .acceptsMercadopago)
    }
}
