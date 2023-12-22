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
            make.top.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(29)
            make.height.equalTo(18)
            make.width.equalTo(18)
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
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
                var newFrame = layoutAttributes.frame
                newFrame.size.width = ceil(size.width)
                newFrame.size.height = ceil(size.height)
                layoutAttributes.frame = newFrame

                return layoutAttributes
    }
    
    //MARK: - Cell Data configuration
    
    func configureCell(data: String) {
        titleLabel.text = data
    }
}
