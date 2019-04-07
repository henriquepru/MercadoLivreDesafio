//
//  EmptyDataView.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 06/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

class EmptyDataView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "nodata".localized
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "trySearchingSomething".localized
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let supportView: UIView = {
        let label = UIView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmptyDataView: CodeView {
    func buildViewHierrarchy() {
        
        addSubview(supportView)
        supportView.addSubview(titleLabel)
        supportView.addSubview(subtitleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            supportView.centerYAnchor.constraint(equalTo: centerYAnchor),
            supportView.leadingAnchor.constraint(equalTo: leadingAnchor),
            supportView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: supportView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: supportView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: supportView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: supportView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: supportView.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: supportView.bottomAnchor)
        ])
    }
}
