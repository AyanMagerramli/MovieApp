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
        configureUI()
        viewModel.getDetail()
        print(viewModel.items)
//        viewModel.success = { [weak self] in
//            self?.collectionView.reloadData()
//        }
    }
    
    //MARK: - Configure UI
    
    private func configureUI() {
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

    //MARK: - Data source

extension MovieDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.items[indexPath.item]
        var cell: UICollectionViewCell
        switch item.type {
        case .poster:
           let posterCell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviePosterCell.identifier, for: indexPath) as! MoviePosterCell
            let item = viewModel.items[indexPath.row]
            if let posterPath = item.data as? String {
                print("POSTER IS \(posterPath)")
                   posterCell.configureCell(data: posterPath)
               }
           // posterCell.configureCell(data: item.data)
            cell = posterCell
           return cell
        case .title:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieTitleCell.identifier, for: indexPath) as! MovieTitleCell
            return cell
        case .info:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieInfoCell.identifier, for: indexPath) as! MovieInfoCell
            return cell
        case .description:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDescriptionCell.identifier, for: indexPath) as! MovieDescriptionCell
            return cell
        case .cast:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCell.identifier, for: indexPath) as! CastCell
            return cell
        }
    }
}
    
    //MARK: - Delegate

extension MovieDetailViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 260)
    }
}
