//
//  ParameterEncoder.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 03/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
