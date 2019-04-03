//
//  EndPointType.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 03/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get}
    var headers: HTTPHeaders? { get }
}
