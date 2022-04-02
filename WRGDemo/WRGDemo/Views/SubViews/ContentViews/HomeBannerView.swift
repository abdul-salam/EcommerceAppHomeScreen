//
//  HomeBannerView.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation
import UIKit

class HomeBannerView: HomeItemContentView {
    
    private lazy var bannerImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeUI() {
        addSubview(bannerImageView)
        bannerImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bannerImageView.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    override func updateViewWithData() {
        guard let bannerViewModel = viewModel as? BannerContentViewModel else {
            return
        }
        bannerImageView.sd_setImage(with: bannerViewModel.url, completed: nil)
    }
}
