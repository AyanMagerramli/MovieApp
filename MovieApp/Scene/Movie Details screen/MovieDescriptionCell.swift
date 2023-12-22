//
//  MovieDescriptionCell.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import UIKit
import SnapKit

class MovieDescriptionCell: UICollectionViewCell {
    
    //MARK: Properties
    
    static let identifier = "MovieDescriptionCell"
    
    //MARK: - UI Elements
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Description"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .justified
        label.textColor = UIColor(named: "languageColor")
        label.numberOfLines = 0
        return label
    }()
    
   //MARK: - Constraints
    
    private func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.leading.equalToSuperview().inset(24)
        }
        
        descriptionText.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(24)
            make.width.equalTo(327)
        }
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        addSubview(descriptionLabel)
        addSubview(descriptionText)
        setupConstraints()
    }
    
    //MARK: - Life Cycle
    
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
    
    //MARK: - Cell Data Configuration
    
    func configureCell(data: String) {
        descriptionText.text = data
    }
}
