//
//  ImageFetcher.swift
//  MercadoLivreDesafio
//
//  Created by Henrique Prudêncio on 06/04/19.
//  Copyright © 2019 Henrique Prudêncio. All rights reserved.
//

import UIKit
import Kingfisher

protocol ImageFetcher {
    func fetchImage(from url: URL, to imageView: UIImageView)
}

final class ImageFetcherKingFisher: ImageFetcher {
    func fetchImage(from url: URL, to imageView: UIImageView) {
        imageView.kf.setImage(with: url)
    }
}

