//
//  HomeTableViewSection.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation

final class HomeTableViewSectionFactory {
    static func createSections(mappedData: HomeResponseMappedData) -> [HomeTableViewSection] {
        return mappedData.items.map() { HomeTableViewSection(item: $0) }
    }
}

class HomeTableViewSection {
    let rows: [HomeContentCellViewModel]
    
    init(item: HomeScreenMappedItem) {
        rows = [HomeContentCellViewModel(item: item)]
    }
}

