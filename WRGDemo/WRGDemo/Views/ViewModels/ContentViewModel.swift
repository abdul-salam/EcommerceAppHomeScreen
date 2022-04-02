//
//  ContentViewModel.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation

class ContentViewModel {
    init?(mappedData: HomeScreenMappedItem) {}
}

class BannerContentViewModel: ContentViewModel {
    let url: URL
    
    override init?(mappedData: HomeScreenMappedItem) {
        guard let mappedData = mappedData as? BannerMappedItem
        else { return nil}
        self.url = mappedData.url
        super.init(mappedData: mappedData)

    }
}

class CarousalContentViewModel: ContentViewModel {
    let urls:[URL]
    override init?(mappedData: HomeScreenMappedItem) {
        guard let mappedData = mappedData as? CarousalMappedItem
        else { return nil }
        urls = mappedData.urls
        super.init(mappedData: mappedData)
    }
}

class ProductsContentViewModel: ContentViewModel {
    let products:[ProductContentViewModel]
    
    override init?(mappedData: HomeScreenMappedItem) {
        guard let mappedData = mappedData as? ProductsMappedItem
        else { return nil}
        products = mappedData.products.map() { ProductContentViewModel(mappedData: $0) }
        super.init(mappedData: mappedData)

    }
}

class ProductContentViewModel {
    let url: URL
    let  title, subTitle: String
    
    init(mappedData: ProductMapped) {
        self.url = mappedData.url
        self.title = mappedData.title
        self.subTitle = mappedData.subTitle
    }
}


