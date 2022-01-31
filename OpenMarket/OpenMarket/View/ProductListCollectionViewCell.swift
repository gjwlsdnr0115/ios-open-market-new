//
//  ProductListCollectionViewCell.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/31.
//

import UIKit

class ProductListCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ProductListCollectionViewCell"
    
    private let accessoryImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [productNameLabel,
                                                                    priceStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let separatorView: UIView = {
        let separatorView: UIView = UIView()
        separatorView.backgroundColor = .systemGray5
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupProductImageView()
        setupLabels()
        setupSeparatorView()
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
        NSLayoutConstraint.activate([productImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.15),
                                     productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor),
                                     productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)])
    }
    
    private func setupLabels() {
        contentView.addSubview(labelStackView)
        contentView.addSubview(stockCountLabel)
        contentView.addSubview(accessoryImageView)

        NSLayoutConstraint.activate([labelStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
                                     labelStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     stockCountLabel.centerYAnchor.constraint(equalTo: productNameLabel.centerYAnchor),
                                     stockCountLabel.trailingAnchor.constraint(equalTo: accessoryImageView.leadingAnchor, constant: -10),
                                     accessoryImageView.heightAnchor.constraint(equalTo: stockCountLabel.heightAnchor),
                                     accessoryImageView.widthAnchor.constraint(equalTo: accessoryImageView.widthAnchor),
                                     accessoryImageView.centerYAnchor.constraint(equalTo: stockCountLabel.centerYAnchor),
                                     accessoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
    }
    
    private func setupSeparatorView() {
        contentView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                                     separatorView.heightAnchor.constraint(equalToConstant: 1)])
    }
    
    func bind(item data: ProductData) {
        if let imageURL: URL = data.thumbnailImageURL {
            productImageView.load(url: imageURL)
        }
        productNameLabel.text = data.name
        priceLabel.text = data.currency + " " + data.price.currencyFormat()
        priceLabel.attributedText = priceLabel.text?.strikeThrough()
        bargainPriceLabel.text = data.currency + " " + data.bargainPrice.currencyFormat()
        stockCountLabel.text = "잔여수량: \(data.stock)"
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
