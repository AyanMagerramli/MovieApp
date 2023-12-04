//
//  HomePopularsCell.swift
//  MovieApp
//
//  Created by Ayan on 04.12.23.
//

import UIKit



class HomePopularsCell: UICollectionViewCell {
    static let identifier = "HomePopularsCell"
    var viewModel = HomeViewModel()
    var indexPath: IndexPath?
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        configureUI()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
    }
    
    private let image = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
    }
    
    private func configureUI() {
        
    }
}
