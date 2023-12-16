//
//  PeopleViewController.swift
//  MovieApp
//
//  Created by Ayan on 08.12.23.
//

import UIKit

class PeopleViewController: UIViewController {
    let viewModel = PeopleViewModel()
    weak var coordinator: MainCoordinator?
    let refreshControl = UIRefreshControl()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    //MARK: -UI Elements
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        title = "Celebrities"
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: TopImageBottomLabelCell.identifier)
        return collection
    }()
    
    //MARK: - UI Configuration
    private func configureUI() {
        view.addSubview(collectionView)
        setupConstraints()
        
        refreshControl.addTarget(self, action: #selector(pullToRequest), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    @objc func pullToRequest() {
        viewModel.reset()
        collectionView.reloadData()
        viewModel.getPeopleList()
    }
    
    //MARK: - View Model Configuration
    fileprivate func configureViewModel() {
        viewModel.getPeopleList()
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
    
    //MARK: -Constraints
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

    //MARK: -Collection View Data Source Methods
extension PeopleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageBottomLabelCell.identifier, for: indexPath) as! TopImageBottomLabelCell
        cell.backgroundColor = .white
        let item = viewModel.items[indexPath.row]
        cell.configureCell(data: item)
        return cell
    }
}
    
    //MARK: -Collection View Delegate Methods
extension PeopleViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2-18, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.makePagination(index: indexPath.item)
    }
}

