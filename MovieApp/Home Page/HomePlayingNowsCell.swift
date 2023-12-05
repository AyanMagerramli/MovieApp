//
//  HomeCell.swift
//  MovieApp
//
//  Created by Ayan on 03.12.23.
//

import UIKit
import SnapKit
import SDWebImage

class HomePlayingNowsCell: UICollectionViewCell {
    static let identifier = "HomeCell"
   // var indexPath: IndexPath?
    var indexPath: IndexPath? {
        didSet {
            collectionView.reloadData()
        }
    }
   
    let viewModel = HomeViewModel()

    override init(frame: CGRect) {
         super.init(frame: frame)
        
        configureUI()
        fetchData()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .red
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(ResusableCell.self, forCellWithReuseIdentifier: "ResusableCell")
        collection.backgroundColor = .red
        return collection
    }()
    
    private func configureUI() {
        contentView.addSubview(collectionView)
        collectionView.frame = contentView.bounds
    }
    
    func fetchData() {
        viewModel.getPopularMovies { [weak self] _ in
            self?.collectionView.reloadData()
        }
        
        viewModel.getTopratedMovies { [weak self] _ in
            self?.collectionView.reloadData()
        }
        
        viewModel.getWelcomeItems{ [weak self] _ in
            self?.collectionView.reloadData()
        }
        
        viewModel.getUpcomingMovies{ [weak self] _ in
            self?.collectionView.reloadData()
        }
    }
}

extension HomePlayingNowsCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var itemsCount = 0
        if indexPath?.section == 0 {
            itemsCount = viewModel.welcomeItem?.results?.count ?? 4
        } else if indexPath?.section == 1 {
            itemsCount = viewModel.popularItem?.results?.count ?? 4
        } else if indexPath?.section == 2 {
            itemsCount = viewModel.topratedItem?.results?.count ?? 4
        } else if indexPath?.section == 3 {
            itemsCount = viewModel.upcomingItem?.results?.count ?? 4
        }
        return itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResusableCell", for: indexPath) as! ResusableCell
        cell.indexPath = indexPath
        if self.indexPath?.section == 0 {
            if let items = viewModel.welcomeItem?.results?[indexPath.row] {
                cell.setupDataForWellcome(data: items)
            }
        } else if self.indexPath?.section == 1 {
            if let items = viewModel.popularItem?.results?[indexPath.row] {
                cell.setupDataForPopular(data: items)
            }
        } else if self.indexPath?.section == 2 {
            if let items = viewModel.topratedItem?.results?[indexPath.row] {
                cell.setupDataForToprated(data: items)
            }
        } else if self.indexPath?.section == 3 {
            if let items = viewModel.upcomingItem?.results?[indexPath.row] {
                cell.setupDataForUpcoming(data: items)
            }
        }
        cell.backgroundColor = .blue
        return cell
    }
}


extension HomePlayingNowsCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 167, height: 300)
    }
}

