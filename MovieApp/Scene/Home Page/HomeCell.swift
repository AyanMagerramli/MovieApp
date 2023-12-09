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

    //MARK: - Lifecycle methods
    override init(frame: CGRect) {
         super.init(frame: frame)
        configureUI()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI Elements
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
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
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    //MARK: - UI Configuration
    private func configureUI() {
        contentView.addSubview(collectionView)
        contentView.addSubview(titleLabel)
        setupConstraints()
    }
    
    //MARK: - Constraints
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
        }
        titleLabel.snp.makeConstraints { make in 
            make.bottom.equalTo(collectionView.snp.top).offset(4)
            make.left.equalToSuperview().inset(34)
        }
    }
    
    //MARK: - Cell Data Configuration
    func configureCell(title: String, movies: [MovieResult]) {
        titleLabel.text = title
        self.movies = movies
        collectionView.reloadData()
    }
}

    //MARK: - Collection View Data Source methods
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

    //MARK: - Collection View Delegate methods
extension HomeCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 180, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 24, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}

