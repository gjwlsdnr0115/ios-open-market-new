//
//  AddProductViewController.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/02/08.
//

import UIKit

class AddProductViewController: UIViewController {
    private lazy var addImageButton: UIButton = {
        let button: UIButton = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.systemBlue
        button.backgroundColor = UIColor.systemGray5
        button.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var imageStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [addImageButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var imageScrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.addSubview(imageStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let nameTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "상품명"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let priceTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "상품가격"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var currencySegmentedControl: UISegmentedControl = {
        let segmentedControl: UISegmentedControl = UISegmentedControl(items: ["KRW", "USD"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    private let bargainTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "할인금액"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let stockTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "재고수량"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "상품등록"
        view.backgroundColor = UIColor.white
        setupNavigationBar()
        setupImageScrollView()
        setupTextFields()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(addImage))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissViewController))
    }
    
    private func setupImageScrollView() {
        view.addSubview(imageScrollView)
        
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            imageScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            imageScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            imageScrollView.heightAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.3),
            imageStackView.centerYAnchor.constraint(equalTo: imageScrollView.centerYAnchor),
            imageStackView.heightAnchor.constraint(equalTo: imageScrollView.heightAnchor),
            imageStackView.leadingAnchor.constraint(equalTo: imageScrollView.leadingAnchor, constant: 16),
            imageStackView.trailingAnchor.constraint(equalTo: imageScrollView.trailingAnchor, constant: -16)
        ])
        setupAddImageButton()
    }
    
    private func setupAddImageButton() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            addImageButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.3),
            addImageButton.heightAnchor.constraint(equalTo: addImageButton.widthAnchor)
        ])
    }
    
    private func setupTextFields() {
        view.addSubview(nameTextField)
        view.addSubview(priceTextField)
        view.addSubview(bargainTextField)
        view.addSubview(stockTextField)
        view.addSubview(currencySegmentedControl)

        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 16),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                     priceTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
                                     priceTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
                                     priceTextField.trailingAnchor.constraint(equalTo: currencySegmentedControl.leadingAnchor, constant: -8),
                                     currencySegmentedControl.centerYAnchor.constraint(equalTo: priceTextField.centerYAnchor),
                                     currencySegmentedControl.heightAnchor.constraint(equalTo: priceTextField.heightAnchor),
                                     currencySegmentedControl.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
                                     bargainTextField.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 8),
                                     bargainTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
                                     bargainTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
                                     stockTextField.topAnchor.constraint(equalTo: bargainTextField.bottomAnchor, constant: 8),
                                     stockTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
                                     stockTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor)])
    }
    
    @objc
    private func addImage() {
        print("addImage")
    }
    
    @objc
    func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("KRW")
        } else if sender.selectedSegmentIndex == 1 {
            print("USD")
        }
    }
    
    @objc
    private func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}
