//
//  JSONParameterEncoder.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 04/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
