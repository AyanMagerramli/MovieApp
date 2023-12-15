//
//  MovieTitleCell.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import UIKit
import SnapKit

class MovieTitleCell: UICollectionViewCell {
    
    //MARK: Properties
    
    static let identifier = "MovieTitleCell"
    
    //MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "This is title"
        label.textColor = UIColor(named: "blackColor")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "favoriteButton"), for: .normal)
        return button
    }()
    
    //MARK: - Setup UI
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(favoriteButton)
        setupConstraints()
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(24)
            make.width.equalTo(198)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(28)
            make.trailing.equalToSuperview().inset(29)
            make.height.equalTo(14)
            make.width.equalTo(16)
        }
    }
    
    //MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
