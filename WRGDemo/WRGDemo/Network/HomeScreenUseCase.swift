//
//  HomeScreenUseCase.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation


protocol HomeScreenUseCase {
    func getHomeScreenItems(completion:@escaping (Result<HomeResponseMappedData, Error>) -> Void)
}
