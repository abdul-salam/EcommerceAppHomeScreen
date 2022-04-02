//
//  HomeScreenResponse.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation

struct HomeScreenResponse: Decodable {
    let items: [HomeScreenItem]
    
}
struct HomeScreenItem: Decodable {
    let id: String
    let type, url : String?
    let urls: [String]?
    let products: [Product]?
}

struct Product: Decodable {
    let url, title, subTitle: String
}

