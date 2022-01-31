//
//  UIImageView+Extension.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/30.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data: Data = try? Data(contentsOf: url), let image: UIImage = UIImage(data: data) {
                DispatchQueue.main.async { self?.image = image }
            }
        }
    }
}

