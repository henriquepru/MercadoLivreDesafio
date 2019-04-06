//
//  UITableView+EmptyView.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 06/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

extension UITableView {
    func setEmptyView() {
        let emptyView = EmptyDataView()
        backgroundView = emptyView
        separatorStyle = .none
    }
    
    func restore() {
        backgroundView = nil
        separatorStyle = .singleLine
    }
}
