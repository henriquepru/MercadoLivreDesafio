//
//  NetworkError.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 03/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingULR = "URL is nil"
}
