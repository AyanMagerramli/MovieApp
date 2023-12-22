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
    
    var viewModel: MovieDetailViewModel
    weak var coordinator: MainCoordinator?
    
    //MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0)
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
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
        print(viewModel.items)
    }
    
    //MARK: - Configure UI
    
    private func configureUI() {
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    
    fileprivate func configureViewModel() {
        viewModel.getDetail()
        viewModel.success = {
            self.collectionView.reloadData()
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
            
        case .poster(let posterPath):
           let posterCell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviePosterCell.identifier, for: indexPath) as! MoviePosterCell
            if let posterPath {
                print("POSTER IS \(posterPath)")
                   posterCell.configureCell(data: posterPath)
               }
            cell = posterCell
           return cell
            
        case .title(let title):
          let titleCell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieTitleCell.identifier, for: indexPath) as! MovieTitleCell
            if let title {
                titleCell.configureCell(data: title)
            }
            cell = titleCell
            return cell
            
        case .info(let movieInfo):
            let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieInfoCell.identifier, for: indexPath) as! MovieInfoCell
               infoCell.viewModel = self.viewModel
            infoCell.genres = movieInfo?.genres ?? []
            if let movieInfo {
                infoCell.configureCell(data: movieInfo)
            }
            cell = infoCell
            return cell
            
        case .description(let description):
            let descriptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDescriptionCell.identifier, for: indexPath) as! MovieDescriptionCell
            if let description {
                descriptionCell.configureCell(data: description)
            }
            cell = descriptionCell
            return cell
            
        case .cast(let cast):
            let castCell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCell.identifier, for: indexPath) as! CastCell
            castCell.cast = cast ?? []
            castCell.delegate = self
            cell = castCell
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
        .init(width: collectionView.frame.width, height: 200)
    }
}

    //MARK: - CastCellProtocol extention

extension MovieDetailViewController: CastCellProtocol {
    func didCelebrityCellTapped(personID: Int) {
        coordinator?.goToPeopleMovieList(id: personID)
    }
    
    func didSeeAllButtonTapped() {
        coordinator?.goToPeople()
    }
}
