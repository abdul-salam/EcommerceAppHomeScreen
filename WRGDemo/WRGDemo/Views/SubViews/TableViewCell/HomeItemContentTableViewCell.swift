//
//  HomeItemContentTableViewCell.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import UIKit

class HomeItemContentTableViewCell: UITableViewCell {
    
    private var itemContentView: HomeItemContentView?
    
    var viewModel: HomeContentCellViewModel? {
        didSet {
            updateViewWithData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func updateViewWithData() {
        addContentViewIFNeeded()
        guard let itemContentView = self.itemContentView,
              let contentViewModel = self.viewModel?.contentViewModel
              else { return }
        itemContentView.viewModel = contentViewModel

    }

    private func addContentViewIFNeeded() {
        guard itemContentView == nil, let viewType = viewModel?.type else { return }
        
        let itemContentView = HomeItemContentViewFactory.createHomeContentView(for: viewType)
        
        contentView.addSubview(itemContentView)
        
        NSLayoutConstraint.activate([
            itemContentView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            itemContentView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            itemContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemContentView.bottomAnchor.constraint(equalTo:contentView.bottomAnchor)
        ])
        
        self.itemContentView = itemContentView
        }
}
