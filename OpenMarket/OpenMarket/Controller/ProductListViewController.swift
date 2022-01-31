//
//  ProductListViewController.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/26.
//

import UIKit

class ProductListViewController: UIViewController {
    // MARK: - Views
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl: UISegmentedControl = UISegmentedControl(items: ["LIST", "GRID"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    private lazy var productCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumInteritemSpacing = 8
        let cellWidth: CGFloat = (self.view.bounds.width - 40) / 2
        let cellHeight: CGFloat = cellWidth * 1.5
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        let collectionView: UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(ProductGridCollectionViewCell.self, forCellWithReuseIdentifier: ProductGridCollectionViewCell.identifier)
        return collectionView
    }()
    
    private var productListData: ProductListData?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupNavigationBar()
        setupCollectionView()
        fetchProductListData()
    }
    
    // MARK: - Setup
    private func setupNavigationBar() {
        navigationItem.titleView = segmentedControl
        segmentedControl.widthAnchor.constraint(equalToConstant: 132).isActive = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProduct))
    }
    
    private func setupCollectionView() {
        view.addSubview(productCollectionView)
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([productCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
                                     productCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     productCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
                                     productCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)])
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    
    // MARK: - Functions
    
    private func fetchProductListData() {
        print("fetching")
        OpenMarketAPI.shared.getProductList(pageNo: 1, itemsPerPage: 10) { [weak self] result in
            switch result {
            case .success(let data):
                self?.productListData = data
                DispatchQueue.main.async {
                    self?.productCollectionView.reloadData()
                }
                
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    @objc
    func segmentedControlValueChanged(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {
//            scrollToTableView()
//        } else if sender.selectedSegmentIndex == 1 {
//            scrollToCollectionView()
//        }
    }
    
    @objc
    func addProduct() {
        print("Add")
    }
}

extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let productCount: Int = productListData?.pages.count {
            return productCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductGridCollectionViewCell.identifier, for: indexPath) as? ProductGridCollectionViewCell else { return UICollectionViewCell() }
        guard let data: ProductData = productListData?.pages[indexPath.row] else { return UICollectionViewCell() }
        cell.bind(item: data)
        return cell
    }
}
