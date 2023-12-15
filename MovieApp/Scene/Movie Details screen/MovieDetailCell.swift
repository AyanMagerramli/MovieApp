//
//  MovieDetailCell.swift
//  MovieApp
//
//  Created by Ayan on 12.12.23.
//

import UIKit

class MovieDetailCell: UICollectionViewCell {
    static let identifier = "MovieDetailCell"
    
    //MARK: - UI Elements
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "This is title"
        label.textColor = UIColor(named: "blackColor")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "This is language"
        label.textColor = UIColor(named: "languageColor")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let languageImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "language")
        return image
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "This is duration"
        label.textColor = UIColor(named: "languageColor")
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let durationImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "duration")
        return image
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
    
    private let languageStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 8
            return stackView
        }()
        
    private let durationStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 8
            return stackView
        }()
    
    private let ratingStackView: UIStackView = {
           let stackView = UIStackView()
           stackView.axis = .horizontal
           stackView.spacing = 8
           return stackView
       }()
       
    private let generalStackView: UIStackView = {
          let stackView = UIStackView()
          stackView.axis = .horizontal
          stackView.spacing = 44
          return stackView
      }()
    
    let items = ["Blue","green", "red"]
    let haptic = UISelectionFeedbackGenerator()
    
    lazy var segmentControl: UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        return view
    }()
    
    @objc func colorChanged() {
        haptic.selectionChanged()
        switch segmentControl.selectedSegmentIndex {
        case 0:
            colorView.backgroundColor = .red
        case 1:
            colorView.backgroundColor = .green
        case 2:
            colorView.backgroundColor = .brown
        default:
            colorView.backgroundColor = .black
        }
    }
    
    let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    //MARK: - Setup UI
    
    private func setupUI() {
        addSubview(image)
        addSubview(titleLabel)
        setupStackViews()
        addSubview(generalStackView)
        addSubview(segmentControl)
        setupConstraints()
    }
    
    private func setupStackViews() {
        // Language Stack View
        languageStackView.addArrangedSubview(languageLabel)
        languageStackView.addArrangedSubview(languageImage)
        
        // Duration Stack View
        durationStackView.addArrangedSubview(durationLabel)
        durationStackView.addArrangedSubview(durationImage)
        
        // Rating Stack View
        ratingStackView.addArrangedSubview(ratingLabel)
        ratingStackView.addArrangedSubview(ratingImage)
        
        // General Stack View
        generalStackView.addArrangedSubview(languageStackView)
        generalStackView.addArrangedSubview(durationStackView)
        generalStackView.addArrangedSubview(ratingStackView)
    }

    //MARK: - Constraints
    
    private func setupConstraints() {
        
        image.snp.makeConstraints { make in
            make.height.equalTo(400)
            make.width.equalTo(350)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(-24)
            make.top.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(image.snp.bottom).offset(24)
            make.height.equalTo(36)
            make.width.equalTo(240)
        }
        
        generalStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(24)
        }
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(generalStackView.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(24)
        }
        
        colorView.snp.makeConstraints { make in
            
        }
    }
    
    //MARK: - Lifecycle methods
    override init(frame: CGRect) {
         super.init(frame: frame)
        haptic.prepare()
        setupUI()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

