//
//  CarouselCell.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    } ()
    
    static let cellIdentifier = "CarouselCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initailizeUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initailizeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initailizeUI() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    public func configure(_ imageUrl: URL) {
        imageView.sd_setImage(with: imageUrl, completed: nil)
    }
}
