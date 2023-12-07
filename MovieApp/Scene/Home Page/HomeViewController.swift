//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    let viewModel = HomeViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        collection.backgroundColor = .white
        return collection
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "Movies"
        label.textColor = UIColor(named: "#222F3D")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let menuButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "menuFilters"), for: .normal)
        button.backgroundColor = .white
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getMovies()
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }

    private func configureUI() {
        view.addSubview(collectionView)
        view.addSubview(titleLabel)
        view.addSubview(menuButton())
        view.backgroundColor = .white
        
        collectionView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(172)
        }
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.top).offset(-24)
            make.left.equalToSuperview().inset(24)
        }
    }
}

//MARK: -Data Source methods
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        let item = viewModel.results[indexPath.row]
        cell.configureCell(title: item.title, movies: item.movies)
        cell.backgroundColor = .white
        return cell
    }
}
    
//MARK: -Delegate Methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 390)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 4, left: 0, bottom: 24, right: 0)
    }
}

