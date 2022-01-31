//
//  ProductCollectionViewCell.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/27.
//

import UIKit

class ProductGridCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ProductGridCollectionViewCell"
    
    private let productImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .red
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bargainPriceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stockCountLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [priceLabel,
                                                                    bargainPriceLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [productNameLabel,
                                                                    priceStackView,
                                                                    stockCountLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layer.cornerRadius = 10
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.borderWidth = 1.5
        setupProductImageView()
        setupLabelStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        priceLabel.isHidden = false
        productImageView.image = nil
    }
    
    private func setupProductImageView() {
        contentView.addSubview(productImageView)
        NSLayoutConstraint.activate([productImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -36),
                                     productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor),
                                     productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                                     productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)])
    }
    
    private func setupLabelStackView() {
        contentView.addSubview(labelStackView)
        
        NSLayoutConstraint.activate([labelStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
                                     labelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                                     labelStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
    }
    
    func bind(item data: ProductData) {
        if let imageURL: URL = data.thumbnailImageURL {
            productImageView.load(url: imageURL)
        }
        productNameLabel.text = data.name
        priceLabel.text = data.currency + " " + data.price.currencyFormat()
        priceLabel.attributedText = priceLabel.text?.strikeThrough()
        bargainPriceLabel.text = data.currency + " " + data.bargainPrice.currencyFormat()
        stockCountLabel.text = "\(data.stock)"
        adjustLabels(data: data)
    }
    
    private func adjustLabels(data: ProductData) {
        if data.price == data.bargainPrice {
            priceLabel.isHidden = true
        }
        if data.stock == 0 {
            stockCountLabel.textColor = .orange
            stockCountLabel.text = "품절"
        }
    }
}
