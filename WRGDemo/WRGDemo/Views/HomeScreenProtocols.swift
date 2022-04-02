//
//  HomeScreenProtocols.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation

protocol HomeScreenViewType {
    var tableViewSections: [HomeTableViewSection] { get set }
}

protocol HomeScreenViewModelType {
    func attach(view: HomeScreenViewType)
}

