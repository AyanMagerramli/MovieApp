//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import UIKit

final class HomeViewController: UIViewController {
    
//    private let viewModel = HomeViewModel()
    
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
//        viewModel.getPopularMovies { [weak self] _ in
//            self?.collectionView.reloadData()
//        }
//        viewModel.getTopratedMovies { [weak self] _ in
//            self?.collectionView.reloadData()
//        }
//        viewModel.getWelcomeItems{ [weak self] _ in
//            self?.collectionView.reloadData()
//        }
//        viewModel.getUpcomingMovies{ [weak self] _ in
//            self?.collectionView.reloadData()
//        }
//        viewModel.success = { [weak self] in
//            self?.collectionView.reloadData()
//            print(self?.viewModel.welcomeItem?.results?.count ?? "noooo")
//        }
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
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePlayingNowsCell", for: indexPath) as! HomePlayingNowsCell
     //   cell.indexPath?.section = indexPath.section
        cell.indexPath = indexPath
        return cell
    }
}
    
//MARK: -Delegate Methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 370)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 10, bottom: 20, right: 20)
    }
}

