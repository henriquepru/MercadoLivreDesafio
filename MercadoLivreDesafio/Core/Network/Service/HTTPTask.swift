//
//  HTTPTask.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 03/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: Any]

public enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(
        bodyParameters: Parameters?,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?
    )
}
