//
//  HomeCarouselView.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation
import UIKit

class HomeCarouselView: HomeItemContentView {
    
    let bannerAR = 1920/504
//    static var width = UIScreen.main.bounds.height/UIScreen.main.bounds.width * ()
    private var dataSourceArray = [URL]() {
        didSet {
            carouselCollectionView.reloadData()
            pageControl.numberOfPages = dataSourceArray.count
        }
    }
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    private var carouselCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.cellIdentifier)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isPagingEnabled = true
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        initializeUI()
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        collectionViewSetUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeUI() {
        addSubview(carouselCollectionView)
        carouselCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        carouselCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        carouselCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        carouselCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        carouselCollectionView.heightAnchor.constraint(equalToConstant: 84.0).isActive = true
        
        addSubview(pageControl)
        pageControl.bottomAnchor.constraint(equalTo: carouselCollectionView.bottomAnchor, constant: 10.0).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    fileprivate func collectionViewSetUp() {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
        carouselCollectionView.collectionViewLayout = layout
            if let layout = carouselCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.minimumInteritemSpacing = 0.0
                layout.minimumLineSpacing = 0.0
                layout.invalidateLayout()
            }
        }
    
    override func updateViewWithData() {
        guard let carousalContentViewModel = viewModel as? CarousalContentViewModel else { return }
        dataSourceArray = carousalContentViewModel.urls
    }
}

extension HomeCarouselView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSourceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.cellIdentifier, for: indexPath) as! CarouselCell  
        let imageUrl = dataSourceArray[indexPath.row]
        cell.configure(imageUrl)
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)

    }

}

extension HomeCarouselView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 84.0)
    }
}
