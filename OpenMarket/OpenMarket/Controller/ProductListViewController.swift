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
    
    private let productCollectionView: UICollectionView = UICollectionView()
    
//
//    private let firstView: UIView = {
//        let view: UIView = UIView()
//        view.backgroundColor = UIColor.green
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private let secondView: UIView = {
//        let view: UIView = UIView()
//        view.backgroundColor = UIColor.red
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private lazy var contentStackView: UIStackView = {
//        let stackView: UIStackView = UIStackView(arrangedSubviews: [firstView, secondView])
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.spacing = 0
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var scrollView: UIScrollView = {
//        let scrollView: UIScrollView = UIScrollView()
//        scrollView.addSubview(contentStackView)
//        scrollView.isPagingEnabled = true
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.isScrollEnabled = false
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        return scrollView
//    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupNavigationBar()
//        setupScrollView()
    }
    
    // MARK: - Setup
    private func setupNavigationBar() {
        navigationItem.titleView = segmentedControl
        segmentedControl.widthAnchor.constraint(equalToConstant: 132).isActive = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProduct))
    }
    
//    private func setupScrollView() {
//        view.addSubview(scrollView)
//        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
//
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
//            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//
//            firstView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            firstView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
//            secondView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            secondView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
//        ])
//    }
    
    // MARK: - Functions
    @objc
    func segmentedControlValueChanged(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {
//            scrollToTableView()
//        } else if sender.selectedSegmentIndex == 1 {
//            scrollToCollectionView()
//        }
    }
    
//    func scrollToCollectionView() {
//        if scrollView.contentOffset.x < self.view.bounds.width {
//            scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x + view.bounds.width, y: scrollView.contentOffset.y), animated: true)
//        }
//    }
//
//    func scrollToTableView() {
//        if scrollView.contentOffset.x >= self.view.bounds.width {
//            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y), animated: true)
//        }
//    }
    
    @objc
    func addProduct() {
        print("Add")
    }
}
