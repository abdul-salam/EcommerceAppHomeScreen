//
//  ProductCell.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import UIKit
import SDWebImage

class ProductCell: UICollectionViewCell {
    
    private var titleLabel = UILabel()
    private var additionalTextLabel = UILabel()
    private var productImageView = UIImageView()
    
    static let cellIdentifier = "ProductCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeUI()
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeUI() {
        contentView.addSubview(additionalTextLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(productImageView)
        
        additionalTextLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        productImageView.translatesAutoresizingMaskIntoConstraints = false

        additionalTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        additionalTextLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: additionalTextLabel.topAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        
        productImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        productImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

    }
    
    func configureProductCell(_ dataModel: ProductContentViewModel) {
        self.titleLabel.text = dataModel.title
        self.additionalTextLabel.text = dataModel.subTitle
        self.productImageView.sd_setImage(with: dataModel.url, completed: nil)
    }
}
