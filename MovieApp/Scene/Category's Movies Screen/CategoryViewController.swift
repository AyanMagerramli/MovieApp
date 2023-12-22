//
//  CategoryViewController.swift
//  MovieApp
//
//  Created by Ayan on 17.12.23.
//

import UIKit

class CategoryViewController: UIViewController  {
    
    //MARK: Properties
    
    var coordinator: MainCoordinator?
    var viewModel = CategoryViewModel()
    var selectedTitle: String?
    var movies: [MovieResult] = []
    
    //MARK: - UI Elements
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-12, height: (view.frame.size.height/3)-40)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 12
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.frame = view.bounds
        collection.dataSource = self
        collection.delegate = self
        collection.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: TopImageBottomLabelCell.identifier)
        title = "All Movies in this Category"
        return collection
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureViewModel()
        getTitleFromUserDefaults()
    }
    
    // Getting title in Home Cell from User Defaults
    fileprivate func getTitleFromUserDefaults() {
        if let savedTitle = UserDefaults.standard.string(forKey: "title") {
            selectedTitle = savedTitle
            viewModel.title = selectedTitle
            print("Selected Title retrieved from UserDefaults: \(savedTitle)")
        }
    }
    
    fileprivate func configureViewModel() {
        viewModel.getMovies { [weak self] in
            self?.collection.reloadData()
        }
        
        viewModel.success = { [weak self] in
            self?.collection.reloadData()
        }
    }
    
    //MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(collection)
    }
}
    
    //MARK: - Data source

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch selectedTitle {
        case "Now Playing":
            let nowPlayingMovies = viewModel.results.first { $0.title == "Now Playing"}
            return nowPlayingMovies?.movies.count ?? 4
       case "Popular":
            let popularMovies = viewModel.results.first { $0.title == "Popular"}
            return popularMovies?.movies.count ?? 4
        case "Top-rated":
            let topRatedMovies = viewModel.results.first { $0.title == "Top-rated"}
            return topRatedMovies?.movies.count ?? 4
        case "Upcoming":
            let upcomingMovies = viewModel.results.first { $0.title == "Upcoming"}
            return upcomingMovies?.movies.count ?? 4
        default:
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageBottomLabelCell.identifier, for: indexPath) as! TopImageBottomLabelCell
        switch selectedTitle {
            case "Now Playing":
            let nowPlayingMovies = viewModel.results.first { $0.title == "Now Playing"}
            if let item = nowPlayingMovies?.movies[indexPath.row] {
                cell.configureCell(data: item)
            }
        case "Popular":
            let popularMovies = viewModel.results.first { $0.title == "Popular"}
            if let item = popularMovies?.movies[indexPath.row] {
                cell.configureCell(data: item)
            }
        case "Upcoming":
            let upcomingMovies = viewModel.results.first { $0.title == "Upcoming"}
            if let item = upcomingMovies?.movies[indexPath.row] {
                cell.configureCell(data: item)
            }
        case "Top-rated":
            let topRatedMovies = viewModel.results.first { $0.title == "Top-rated"}
            if let item = topRatedMovies?.movies[indexPath.row] {
                cell.configureCell(data: item)
            }
        default:
            let nowPlayingMovies = viewModel.results.first { $0.title == "Now Playing"}
            if let item = nowPlayingMovies?.movies[indexPath.row] {
                cell.configureCell(data: item)
            }
        }
        
        return cell
    }
}

//MARK: - Delegate

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch selectedTitle {
            case "Now Playing":
            let nowPlayingMovies = viewModel.results.first { $0.title == "Now Playing"}
            if let item = nowPlayingMovies?.movies[indexPath.row] {
                coordinator?.goToMovieDetail(id: item.id ?? 0)
            }
        case "Popular":
            let popularMovies = viewModel.results.first { $0.title == "Popular"}
            if let item = popularMovies?.movies[indexPath.row] {
                coordinator?.goToMovieDetail(id: item.id ?? 0)
            }
        case "Upcoming":
            let upcomingMovies = viewModel.results.first { $0.title == "Upcoming"}
            if let item = upcomingMovies?.movies[indexPath.row] {
                coordinator?.goToMovieDetail(id: item.id ?? 0)
            }
        case "Top-rated":
            let topRatedMovies = viewModel.results.first { $0.title == "Top-rated"}
            if let item = topRatedMovies?.movies[indexPath.row] {
                coordinator?.goToMovieDetail(id: item.id ?? 0)
            }
        default:
            let nowPlayingMovies = viewModel.results.first { $0.title == "Now Playing"}
            if let item = nowPlayingMovies?.movies[indexPath.row] {
                coordinator?.goToMovieDetail(id: item.id ?? 0)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.makePagination(index: indexPath.item)
    }
}

