//
//  HomeItemContentView.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import UIKit

class HomeItemContentView: UIView {
    var viewModel: ContentViewModel? {
        didSet {
            updateViewWithData()
        }
    }
    
    func updateViewWithData() {
        
    }
}
