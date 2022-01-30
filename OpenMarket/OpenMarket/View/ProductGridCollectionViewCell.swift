//
//  ProductCollectionViewCell.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/27.
//

import UIKit

class ProductGridCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ProductGridCollectionViewCell"
    
    private let prodcuvtImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .black
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .red
        return label
    }()
    
    private let bargainPriceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .gray
        return label
    }()
    
    private let stockCountLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .gray
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [productNameLabel,
                                                                    priceLabel,
                                                                    bargainPriceLabel,
                                                                    stockCountLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                                     contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}
