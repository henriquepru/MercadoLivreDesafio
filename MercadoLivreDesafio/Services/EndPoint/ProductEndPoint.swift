//
//  ProductEndPoint.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 04/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case production
    case staging
}

public enum ProductApi {
    case search(searchedString: String)
}

extension ProductApi: EndPointType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production: return "https://api.mercadolibre.com/sites/MLU/"
        case .staging: return "https://api.mercadolibre.com/sites/MLU/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return "search"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .search(let searchedString):
            return .requestParameters(bodyParameters: nil, urlParameters: ["q": searchedString])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
