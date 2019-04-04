//
//  NetworkManager.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 04/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    static let ProductAPIKey = "API_KEY"
    private let router = Router<ProductApi>()
    
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Void> {
        switch response.statusCode {
        case 200...299: return .success(())
        case 401...500: return .failure(NetworkResponseError.authenticationError)
        case 501...599: return .failure(NetworkResponseError.badRequest)
        case 600: return .failure(NetworkResponseError.outdated)
        default: return .failure(NetworkResponseError.failed)
        }
    }
}

enum NetworkResponseError: String, Error {
    case authenticationError = "You need to be authenticate first."
    case badRequest = "Bad Request."
    case failed = "Network request failed."
    case outdated = "The url you requested is outdated."
    
}
