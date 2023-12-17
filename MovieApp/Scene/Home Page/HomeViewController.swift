//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController, HomeCellDelegate {
    
    //Home Cell Delegate function
    
    func didSelectTopImageBottomLabelCell(with movieID: Int) {
        coordinator?.goToMovieDetail(id: movieID)
    }
    
    //MARK: Properties
    
    let viewModel = HomeViewModel()
    var coordinator: MainCoordinator?
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }

    //MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        title = "Movies"
        collection.dataSource = self
        collection.delegate = self
        collection.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        collection.backgroundColor = .white
        return collection
    }()
    
    //MARK: - UI Configuration
    private func configureUI() {
        view.addSubview(collectionView)
        view.backgroundColor = .white
        setupConstraints()
        setupNavigationBarButtons()
    }
    
    //MARK: - Constraints
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    //MARK: - View Model Configuration
    fileprivate func configureViewModel() {
        viewModel.getMovies()
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    //MARK: - Setup Navigation Bar Button Items
   private func setupNavigationBarButtons() {
        let searchButton = UIBarButtonItem(
            image: UIImage(named: "searchAction"),
            style: .plain,
            target: self,
            action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItem = searchButton
        
        let menuFilterButton = UIBarButtonItem(
           image: UIImage(named: "menuFilters"),
           style: .plain,
           target: self,
           action: #selector(menuFilterButtonTapped))
        navigationItem.leftBarButtonItem = menuFilterButton
    }
    
    @objc func searchButtonTapped() {
        print("Coordinator: \(String(describing: coordinator))")
        coordinator?.goToSearch()
    }
    
    @objc func menuFilterButtonTapped () {
        print("Menu filter button has been tapped")
    }
}

    //MARK: -Data Source methods
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        cell.delegate = self
        let item = viewModel.results[indexPath.row]
        cell.configureCell(title: item.title, movies: item.movies)
        cell.backgroundColor = .white
        return cell
    }
}
    
    //MARK: -Delegate Methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let controller = MovieDetailViewController()
//       // controller.viewModel = MovieDetailViewModel(movieID: movieID ?? 23898)
//    }
//    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

