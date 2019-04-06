//
//  ProductListViewController.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 05/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

protocol ProductListViewControllerOutput {
    func searchProducts(searchString: String)
    func selectProductItem(itemIndex: Int)
}

class ProductListViewController: UIViewController {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundColor = .red
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.keyboardDismissMode = .onDrag
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var dataSource = {
        ProductListDataSourceDelegate(tableView: tableView,
                                      selectItemHandler: output?.selectProductItem ?? {_ in })
    }()
    
    var output: ProductListViewControllerOutput?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductListViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension ProductListViewController: ProductListPresenterOutput {
    func displayProducts(products: [ProductItemCell.ViewModel]) {
        setupDataSource(viewModels: products)
    }
    
    func displayError(errorMessage: String) {
        
    }
}

extension ProductListViewController {
    private func setupDataSource(viewModels: [ProductItemCell.ViewModel]) {
        dataSource.viewModels = viewModels
    }
}

extension ProductListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            searchBar.resignFirstResponder()
            output?.searchProducts(searchString: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension ProductListViewController: CodeView {
    func buildViewHierrarchy() {
        self.view.addSubview(searchBar)
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 60),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
