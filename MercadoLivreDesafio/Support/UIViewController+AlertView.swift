//
//  UIViewController+AlertView.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 08/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showErrorAlertView(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cancel".localized, style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
}
