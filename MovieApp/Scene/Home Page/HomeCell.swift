//
//  HomeCell.swift
//  MovieApp
//
//  Created by Ayan on 03.12.23.
//

import UIKit
import SnapKit

protocol HomeCellDelegate {
    func didSeeAllButtonTapped(with title: String)
    func didSelectTopImageBottomLabelCell(with movieID: Int?)
}

class HomeCell: UICollectionViewCell {
    
    //MARK: Properties
   
    static let identifier = "HomeCell"
    var movies = [MovieResult]()
    var coordinator: MainCoordinator?
    var delegate: HomeCellDelegate?
    var movieInfoViewModel: MovieDetailViewModel?
    var titleForCategory: String?

    //MARK: - Lifecycle methods
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        configureUI()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI Elements
    
     let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(named: "#2B2C34")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: TopImageBottomLabelCell.identifier)
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    lazy var seeAllButton: UIButton = { [weak self] in
        guard let self = self else { return UIButton() }
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
     //   button.isEnabled = true //by default this is true
        button.setTitle("See all >", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .white
        print("Button created in HomeCell")
        button.addTarget(self, action: #selector(didSeeAllButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func didSeeAllButtonTapped(_ sender: UIButton) {
        print("See all button tapped")
        delegate?.didSeeAllButtonTapped(with: titleForCategory ?? "No value")
        UserDefaults.standard.removeObject(forKey: "title")
        UserDefaults.standard.setValue(titleForCategory, forKey: "title")

    }
    
    //MARK: - UI Configuration
    
    private func configureUI() {
        contentView.addSubview(collectionView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(seeAllButton)
        setupConstraints()
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.leading.equalToSuperview().inset(34)
        }
        
        seeAllButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.trailing.equalToSuperview().inset(34)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(30)
            make.height.equalTo(240)
            make.width.equalToSuperview()
        }
    }
    
    //MARK: - Cell Data Configuration
    
    func configureCell(title: String, movies: [MovieResult]) {
        titleLabel.text = title
        self.movies = movies
        collectionView.reloadData()
    }
}

    //MARK: - Collection View Data Source methods

extension HomeCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageBottomLabelCell.identifier, for: indexPath) as! TopImageBottomLabelCell
        cell.backgroundColor = .white
        cell.configureCell(data: movies[indexPath.row])
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 16
        return cell
    }
}

    //MARK: - Collection View Delegate methods

extension HomeCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movieID = movies[indexPath.item].id {
            print("ayannnnn \(movieID)")
  //          let cell = CastCell()
//            if cell.cast[indexPath.row].id == movieID {
//                
//            }
            delegate?.didSelectTopImageBottomLabelCell(with: movieID)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2-20, height: collectionView.frame.height-16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}

