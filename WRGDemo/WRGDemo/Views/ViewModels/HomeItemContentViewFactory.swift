//
//  HomeItemContentViewFactory.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import UIKit


final class HomeItemContentViewFactory {
    static func createHomeContentView(for type: HomeScreeItemType) -> HomeItemContentView {
        switch type {
        case .banner:
            return HomeBannerView()
        case .products:
            return HomeProductsView()
        case .carousel:
            return HomeCarouselView()
        }
    }
}
