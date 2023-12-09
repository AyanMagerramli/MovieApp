//
//  PeopleViewController.swift
//  MovieApp
//
//  Created by Ayan on 08.12.23.
//

import UIKit

class PeopleViewController: UIViewController {
    let viewModel = PeopleViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: TopImageBottomLabelCell.identifier)
        collection.backgroundColor = .white
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupConstraints()
        viewModel.getPeopleList()
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
      
    }
    private func configureUI() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.backgroundColor = .red
        collectionView.snp.makeConstraints { make in
            make.bottom.top.left.right.equalToSuperview().inset(0)
        }
    }
}

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
    
//MARK: -Delegate Methods
extension PeopleViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2-10, height: 240)
    }
}

