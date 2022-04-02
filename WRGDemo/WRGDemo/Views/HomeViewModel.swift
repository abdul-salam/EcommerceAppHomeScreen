//
//  HomeViewModel.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation

class HomeViewModel: HomeScreenViewModelType {
    
    private var view:HomeScreenViewType?
    private let service: HomeScreenUseCase
    
    init(service: HomeScreenUseCase) {
        self.service = service
    }
    
    func attach(view: HomeScreenViewType) {
        self.view = view
        fetchData()
    }
    
    private func fetchData() {
        service.getHomeScreenItems { [weak self] response in
            switch response{
            case .success(let data):
                self?.updateView(data: data)
            case .failure(_):
                break
            }
        }
    }
    
    private func updateView(data: HomeResponseMappedData) {
        view?.tableViewSections = HomeTableViewSectionFactory.createSections(mappedData: data)
    }
    
}
