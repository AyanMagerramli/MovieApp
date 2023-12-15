//
//  MovieInfoCell.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import UIKit
import SnapKit

class MovieInfoCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "This is rating"
        label.textColor = UIColor(named: "languageColor")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let ratingImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "rating")
        return image
    }()
    
    private let ratingStackView: UIStackView = {
           let stackView = UIStackView()
           stackView.axis = .horizontal
           stackView.spacing = 4
           return stackView
       }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Language"
        label.textColor = UIColor(named: "languageColor")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let languageType: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "English"
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let languageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Length"
        label.textColor = UIColor(named: "languageColor")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let durationLength: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "2 hours"
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let durationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private let rating2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Rating"
        label.textColor = UIColor(named: "languageColor")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let rating2Point: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "7.8"
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let rating2StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private let generalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 50
        return stackView
    }()
    
    //MARK: - Setup stack views
    
    private func setupStackView() {
        ratingStackView.addArrangedSubview(ratingImage)
        ratingStackView.addArrangedSubview(ratingLabel)
        
        languageStackView.addArrangedSubview(languageLabel)
        languageStackView.addArrangedSubview(languageType)
        
        durationStackView.addArrangedSubview(durationLabel)
        durationStackView.addArrangedSubview(durationLength)
        
        rating2StackView.addArrangedSubview(rating2Label)
        rating2StackView.addArrangedSubview(rating2Point)
        
        generalStackView.addArrangedSubview(durationStackView)
        generalStackView.addArrangedSubview(languageStackView)
        generalStackView.addArrangedSubview(rating2StackView)
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        ratingStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(24)
        }
        
        generalStackView.snp.makeConstraints { make in
            make.top.equalTo(ratingStackView.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(24)
        }
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        setupStackView()
        addSubview(ratingStackView)
        addSubview(generalStackView)
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
}
