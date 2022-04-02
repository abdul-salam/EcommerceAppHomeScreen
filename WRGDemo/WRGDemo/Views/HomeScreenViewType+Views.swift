//
//  HomeScreenViewType+Cells.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation


extension HomeScreeItemType {
    var reusableIdentifier: String {
        return "\(self.rawValue)" + "cell"
    }
}
