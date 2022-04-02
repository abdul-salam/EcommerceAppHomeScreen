//
//  HomeResponseMappedData.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation


struct HomeResponseMappedData {
    let items: [HomeScreenMappedItem]
    
    init(response: HomeScreenResponse) {
        items = response.items.compactMap() { HomeScreenMappedItemFactory.createHomeMappedItem(item: $0) }
    }
}

protocol HomeScreenMappedItem {
    var type: HomeScreeItemType { get }
    var id: String { get }
    init?(item: HomeScreenItem)
}

struct BannerMappedItem: HomeScreenMappedItem {
    var type: HomeScreeItemType { return .banner}
    var id: String
    var url: URL
    
    init?(item: HomeScreenItem) {
        guard let urlString = item.url,
              let url = URL(string: urlString)
        else { return nil }
        self.id = item.id
        self.url = url
    }
}

struct ProductsMappedItem: HomeScreenMappedItem {
    var type: HomeScreeItemType { return .products}
    var id: String
    var products: [ProductMapped]
    
    init?(item: HomeScreenItem) {
        guard let products = item.products,
              !products.isEmpty
        else { return nil }
        self.id = item.id
        self.products = products.compactMap() { ProductMapped(product: $0) }
    }
}

struct CarousalMappedItem: HomeScreenMappedItem {
    var type: HomeScreeItemType { return .carousel}
    var id: String
    var urls: [URL]
    
    init?(item: HomeScreenItem) {
        guard let urlStrings = item.urls
        else { return nil }
        
        let urls = urlStrings.compactMap({ URL(string: $0) })
        guard !urls.isEmpty else { return nil }
        self.id = item.id
        self.urls = urls
        
    }
}

struct ProductMapped  {
    let url: URL
    let  title, subTitle: String
    
    init?(product: Product) {
        guard let url = URL(string:  product.url) else { return nil }
        self.title = product.title
        self.url = url
        self.subTitle = product.subTitle
    }
}


final class HomeScreenMappedItemFactory {
    
    static func createHomeMappedItem(item: HomeScreenItem) -> HomeScreenMappedItem?{
        guard let type = item.type,
              let homeType = HomeScreeItemType(rawValue: type)
        else { return nil}
        
        switch homeType {
        case .banner:
            return BannerMappedItem(item: item)
        case .products:
            return ProductsMappedItem(item: item)
        case .carousel:
            return CarousalMappedItem(item: item)
        }
    }
}
