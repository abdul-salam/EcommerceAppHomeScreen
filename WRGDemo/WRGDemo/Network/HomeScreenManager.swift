//
//  HomeScreenManager.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation

class HomeScreenManager: HomeScreenUseCase {

    func getHomeScreenItems(completion:@escaping (Result<HomeResponseMappedData, Error>) -> Void){
        let data: HomeScreenResponse? = DataFetchService.fetchData(jsonFileName:"jsonviewer")
        if let responseData = data {
            let mappedData = HomeResponseMappedData(response: responseData)
            completion(.success(mappedData))
        } else {
            completion(.failure(NSError()))
        }
    }
    

}
