//
//  HomeContentCellViewModel.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation

class HomeContentCellViewModel {
    var type: HomeScreeItemType
    var contentViewModel: ContentViewModel?
    
    init(item: HomeScreenMappedItem) {
        self.type = item.type

        switch item.type {
        case .banner:
            contentViewModel = BannerContentViewModel(mappedData: item)
        case .products:
            contentViewModel = ProductsContentViewModel(mappedData: item)
        case .carousel:
            contentViewModel = CarousalContentViewModel(mappedData: item)
        }
    }
}


