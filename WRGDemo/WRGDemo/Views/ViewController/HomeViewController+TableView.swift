//
//  HomeViewController+TableView.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func registerCells() {
        HomeScreeItemType.allCases.forEach() {
            homeTableView.register(HomeItemContentTableViewCell.self, forCellReuseIdentifier: $0.reusableIdentifier)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableViewSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewSections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = tableViewSections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellVM.type.reusableIdentifier, for: indexPath) as! HomeItemContentTableViewCell
        cell.viewModel = cellVM
        return cell
    }
}
