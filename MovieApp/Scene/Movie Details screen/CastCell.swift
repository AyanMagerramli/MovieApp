//
//  CastCell.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import UIKit
import SnapKit

class CastCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    
    private let castLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "Cast"
        label.textColor = .black
        return label
    }()
    
    private let seeMoreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "seeMore"), for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    lazy var castCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: TopImageBottomLabelCell.identifier)
        return collection
    }()
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        castLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.leading.equalToSuperview().inset(24)
        }
        
        seeMoreButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.trailing.equalToSuperview().inset(24)
        }
        
        castCollection.snp.makeConstraints { make in
            make.top.equalTo(castLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(120)
        }
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        addSubview(castLabel)
        addSubview(seeMoreButton)
        addSubview(castCollection)
    }
}

    //MARK: - Data Source

extension CastCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageBottomLabelCell.identifier, for: indexPath) as! TopImageBottomLabelCell
        return cell
    }
}
    
    //MARK: - Data Source

extension CastCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
