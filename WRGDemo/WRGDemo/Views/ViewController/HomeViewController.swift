//
//  HomeViewController.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import UIKit

class HomeViewController: UIViewController, HomeScreenViewType {

    var tableViewSections: [HomeTableViewSection] = [] {
        didSet {
            homeTableView.reloadData()
        }
    }
    let viewModel: HomeScreenViewModelType = HomeViewModel(service: HomeScreenManager())
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        viewModel.attach(view: self)
    }


}

