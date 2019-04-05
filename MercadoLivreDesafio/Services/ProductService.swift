//
//  ProductService.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 05/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

protocol ProductServiceType {
    func fetchProducts(with searchString: String, completion: @escaping (Result<[Product]>) -> Void)
}

class ProductService: ProductServiceType {
    
    private let router: Router<ProductApi>
    
    init(router: Router<ProductApi> = Router<ProductApi>()) {
        self.router = router
    }
    
    func fetchProducts(with searchString: String, completion: @escaping (Result<[Product]>) -> Void) {
        router.request(.search(searchedString: searchString)) { data, response, error in
            
            if error != nil {
                completion(.failure(NetworkResponseError.connection))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                
                let result = NetworkManager.handleNetworkResponse(response)
                
                switch result {
                case .success:
                    
                    guard let responseData = data else {
                        completion(.failure(NetworkResponseError.noData))
                        return
                    }
                    
                    do {
                        let apiResponse = try JSONDecoder().decode(ProductApiResponse.self, from: responseData)
                        completion(.success(apiResponse.products))
                    } catch {
                        completion(.failure(NetworkResponseError.unableToDecode))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
