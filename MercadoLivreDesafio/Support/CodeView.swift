//
//  CodeView.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 05/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

protocol CodeView: class {
    func buildViewHierrarchy()
    func setupConstraints()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierrarchy()
        setupConstraints()
    }
}
