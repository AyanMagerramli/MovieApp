//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Ayan on 12.12.23.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        title = "Celebrities"
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(MovieDetailCell.self, forCellWithReuseIdentifier: MovieDetailCell.identifier)
        return collection
    }()
    
    
    //MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
}

    //MARK: - Data source

extension MovieDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
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
