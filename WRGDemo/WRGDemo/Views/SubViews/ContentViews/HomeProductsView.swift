//
//  HomeProductView.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation
import UIKit

class HomeProductsView: HomeItemContentView, UICollectionViewDelegate {
    
    private var dataSourceArray = [ProductContentViewModel]() {
        didSet {
            productCollectionView.reloadData()
        }
    }
    
    private var contentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5.0
        stackView.axis = .vertical
        return stackView
    } ()
    
    private var headerView: UIView = {
        let headerView = UIView(frame: .zero)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    } ()
    
    private var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Discounts for you"
        return label
    } ()
    
    private var viewAllButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("View All >", for: .normal)
        return button
    }()
    
    private var productCollectionView: IntrinsicSizeCollectionView = {
        let collection = IntrinsicSizeCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.cellIdentifier)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        initializeUI()
        productCollectionView.dataSource = self
        productCollectionView.delegate = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeUI() {
        addSubview(contentStack)
        
        headerView.addSubview(titleLabel)
        headerView.addSubview(viewAllButton)
        
        contentStack.addArrangedSubview(headerView)
        contentStack.addArrangedSubview(productCollectionView)
        
        contentStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        productCollectionView.heightAnchor.constraint(equalToConstant: 330.0).isActive = true
        
        
        titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:headerView.leadingAnchor).isActive = true
        

        viewAllButton.trailingAnchor.constraint(equalTo:headerView.trailingAnchor).isActive = true
        viewAllButton.centerYAnchor.constraint(equalTo:headerView.centerYAnchor).isActive = true

        viewAllButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        viewAllButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        headerView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true


        collectionViewSetUp()
    }
    
    fileprivate func collectionViewSetUp() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        productCollectionView.collectionViewLayout = layout
        if let layout = productCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 0.0
            layout.minimumLineSpacing = 0.0
            layout.invalidateLayout()
        }
    }
    
    override func updateViewWithData() {
        guard let productContentViewModel = viewModel as? ProductsContentViewModel else { return }
        dataSourceArray = productContentViewModel.products
    }
}

extension HomeProductsView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSourceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.cellIdentifier, for: indexPath) as? ProductCell else { return UICollectionViewCell() }
        let product = dataSourceArray[indexPath.row]
        cell.configureProductCell(product)
        return cell
    }
    
    
}

extension HomeProductsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.width / 2) , height: 110)
    }
}



class IntrinsicSizeCollectionView: UICollectionView {
    // MARK: - lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        self.setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if !self.bounds.size.equalTo(self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        get {
            let intrinsicContentSize = self.contentSize
            return intrinsicContentSize
        }
    }

    // MARK: - setup
    func setup() {
        self.isScrollEnabled = false
        self.bounces = false
    }
}
