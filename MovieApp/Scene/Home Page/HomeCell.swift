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
    var movies = [MovieResult]()

    override init(frame: CGRect) {
         super.init(frame: frame)
        configureUI()
        setupConstraints()
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
        collection.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: TopImageBottomLabelCell.identifier)
        collection.backgroundColor = .white
        return collection
    }()
    
    private func configureUI() {
        contentView.addSubview(collectionView)
        contentView.addSubview(titleLabel)
        collectionView.showsHorizontalScrollIndicator = false
       // collectionView.frame = contentView.bounds
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(390)
        }
        titleLabel.snp.makeConstraints { make in 
            make.bottom.equalTo(collectionView.snp.top).offset(-16)
            make.left.equalTo(collectionView.snp.left).offset(24)
        }
    }
    
    func configureCell(title: String, movies: [MovieResult]) {
        titleLabel.text = title
        self.movies = movies
        collectionView.reloadData()
    }
}

extension HomeCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageBottomLabelCell.identifier, for: indexPath) as! TopImageBottomLabelCell
        cell.backgroundColor = .white
        cell.configureCell(data: movies[indexPath.row])
        cell.backgroundColor = .white
        return cell
    }
}


extension HomeCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 167, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 24, bottom: 0, right: 0)
    }
}

