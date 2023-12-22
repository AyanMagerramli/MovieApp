//
//  CastCell.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import UIKit
import SnapKit

protocol CastCellProtocol {
    func didSeeAllButtonTapped()
    func didCelebrityCellTapped(personID: Int)
}

class CastCell: UICollectionViewCell {
    
    //MARK: Properties
    
    static let identifier = "CastCell"
    var cast = [CastElement?]()
    var coordinator: MainCoordinator?
    var delegate: CastCellProtocol?
    
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
        button.addTarget(self, action: #selector(didSeeAllButtonTapped), for: .touchUpInside)
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
        collection.backgroundColor = .white
        return collection
    }()
    
    @objc private func didSeeAllButtonTapped() {
        delegate?.didSeeAllButtonTapped()
    }
    
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
            make.height.equalTo(200)
            make.width.equalToSuperview()
        }
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        addSubview(castLabel)
        addSubview(seeMoreButton)
        addSubview(castCollection)
        setupConstraints()
    }
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    //MARK: - Data Source

extension CastCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageBottomLabelCell.identifier, for: indexPath) as! TopImageBottomLabelCell
        cell.backgroundColor = .white
        if let cast = cast[indexPath.row] {
            cell.configureCell(data: cast)
        }
        return cell
    }
}
    
    //MARK: - Data Source

extension CastCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didCelebrityCellTapped(personID: cast[indexPath.row]?.id ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 140, height: collectionView.frame.height-30)
    }
}
