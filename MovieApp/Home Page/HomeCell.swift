//
//  HomeCell.swift
//  MovieApp
//
//  Created by Ayan on 03.12.23.
//

import UIKit
import SnapKit

class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    let viewModel = HomeViewModel()
    var indexPath: IndexPath? {
        didSet {
            collectionView.reloadData()
        }
    }

    override init(frame: CGRect) {
         super.init(frame: frame)
        configureUI()
        setupConstraints()
        fetchData()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(named: "#2B2C34")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(NestedCollectionCell.self, forCellWithReuseIdentifier: NestedCollectionCell.identifier)
        collection.backgroundColor = .white
        return collection
    }()
    
    private func configureUI() {
        contentView.addSubview(collectionView)
        contentView.addSubview(titleLabel)
       // collectionView.frame = contentView.bounds
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(400)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp_topMargin).offset(16)
            $0.left.equalTo(collectionView.snp_leftMargin).offset(12)
        }
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

extension HomeCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var itemsCount = 0
        if indexPath?.section == 0 {
            itemsCount = viewModel.nowPlayingItem?.results?.count ?? 4
            titleLabel.text = "Popular"
        } else if indexPath?.section == 1 {
            itemsCount = viewModel.popularItem?.results?.count ?? 4
            titleLabel.text = "Trending"
        } else if indexPath?.section == 2 {
            itemsCount = viewModel.topratedItem?.results?.count ?? 4
            titleLabel.text = "Top rated"
        } else if indexPath?.section == 3 {
            itemsCount = viewModel.upcomingItem?.results?.count ?? 4
            titleLabel.text = "Upcoming"
        }
        return itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NestedCollectionCell.identifier, for: indexPath) as! NestedCollectionCell
        cell.backgroundColor = .white
        cell.indexPath = indexPath
        if self.indexPath?.section == 0 {
            if let items = viewModel.nowPlayingItem?.results?[indexPath.row] {
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
        return cell
    }
}


extension HomeCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 167, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 24, bottom: 0, right: 0)
    }
}

