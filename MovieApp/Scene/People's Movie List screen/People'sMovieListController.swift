//
//  People'sMovieListController.swift
//  MovieApp
//
//  Created by Ayan on 22.12.23.
//

import UIKit

class PeopleMovieListController: UIViewController {
    
    //MARK: Properties
    
    var coordinator: MainCoordinator?
    var viewModel: PeopleMovieListViewModel
    
    //MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-4, height: (view.frame.size.height/3)-20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 4
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.frame = view.bounds
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: TopImageBottomLabelCell.identifier)
        title = "Movies"
        return collection
    }()
    
    init(viewModel: PeopleMovieListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    //MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(collectionView)
    }
    
    private func setupViewModel() {
        viewModel.getMovies()
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

    //MARK: - Data Source

extension PeopleMovieListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageBottomLabelCell.identifier, for: indexPath) as! TopImageBottomLabelCell
        if let movie = viewModel.movies[indexPath.row] {
            cell.configureCell(data: movie)
        }
        return cell
    }
}

    //MARK: - Delegate

extension PeopleMovieListController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.goToMovieDetail(id: viewModel.movies[indexPath.row]?.id ?? 0)
    }
}
