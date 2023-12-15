//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Ayan on 12.12.23.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    var viewModel = MovieDetailViewModel(movieID: 0)
    weak var coordinator: MainCoordinator?
    
    //MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        title = "Movie Detail"
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(MoviePosterCell.self, forCellWithReuseIdentifier: MoviePosterCell.identifier)
        collection.register(MovieTitleCell.self, forCellWithReuseIdentifier: MovieTitleCell.identifier)
        collection.register(MovieInfoCell.self, forCellWithReuseIdentifier: MovieInfoCell.identifier)
        collection.register(MovieDescriptionCell.self, forCellWithReuseIdentifier: MovieDescriptionCell.identifier)
        collection.register(CastCell.self, forCellWithReuseIdentifier: CastCell.identifier)
        return collection
    }()
    
    
    //MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovieDetail()
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

    //MARK: - Data source

extension MovieDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}
    
    //MARK: - Delegate

extension MovieDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
