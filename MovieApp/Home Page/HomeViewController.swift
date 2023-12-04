//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(HomePlayingNowsCell.self, forCellWithReuseIdentifier: "HomePlayingNowsCell")
        collection.backgroundColor = .white
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getWelcomeItems()
        viewModel.getPopularMovies()
        viewModel.getTopratedMovies()
        viewModel.getUpcomingMovies()
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func configureUI() {
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        title = "Movies"
    }
}

//MARK: -Data Source methods
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var moviesCount = 0
        if section == 0 {
           moviesCount = viewModel.welcomeItem?.results?.count ?? 0
        } else if section == 1{
           moviesCount = viewModel.popularItem?.results?.count ?? 0
        } else if section == 2 {
            moviesCount = viewModel.topratedItem?.results?.count ?? 0
        } else if section == 3 {
            moviesCount = viewModel.upcomingItem?.results?.count ?? 0
        }
        return moviesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePlayingNowsCell", for: indexPath) as! HomePlayingNowsCell
        cell.indexPath = indexPath
        cell.viewModel = viewModel
        if indexPath.section == 0 {
            cell.setupDataForWellcome(data: (viewModel.welcomeItem?.results?[indexPath.row])!)
        } else if indexPath.section == 1 {
            cell.setupDataForPopular(data: (viewModel.popularItem?.results?[indexPath.row])!)
        } else if indexPath.section == 2 {
            cell.setupDataForToprated(data: (viewModel.topratedItem?.results?[indexPath.row])!)
        } else if indexPath.section == 3 {
            cell.setupDataForUpcoming(data: (viewModel.upcomingItem?.results?[indexPath.row])!)
        }
        
        cell.backgroundColor = .blue
        return cell
    }
}


//MARK: -Delegate Methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 167, height: 272)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 10, bottom: 20, right: 20)
    }
}


