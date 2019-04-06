//
//  ProductListDataSourceDelegate.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 06/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

final class ProductListDataSourceDelegate: NSObject {
    
    typealias SelectItemHandler = ((_ itemIndex: Int) -> ())
    
    private unowned let tableView: UITableView
    private let selectItemHandler: SelectItemHandler?
    
    var viewModels: [ProductItemCell.ViewModel] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, selectItemHandler: @escaping SelectItemHandler) {
        self.tableView = tableView
        self.selectItemHandler = selectItemHandler
        super.init()
        
        registerCells(in: tableView)
        setupTableView(in: tableView)
    }
}

extension ProductListDataSourceDelegate {
    
    private func registerCells(in tableView: UITableView) {
        DispatchQueue.main.async {
            tableView.register(ProductItemCell.self)
        }
    }
    
    private func setupTableView(in tableView: UITableView) {
        DispatchQueue.main.async {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.reloadData()
        }
    }
}

extension ProductListDataSourceDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ProductItemCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(viewMode: viewModels[indexPath.item])
        
        return cell
    }
}

extension ProductListDataSourceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectItemHandler?(indexPath.item)
    }
}
