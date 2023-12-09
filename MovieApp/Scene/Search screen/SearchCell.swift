//
//  SearchCell.swift
//  MovieApp
//
//  Created by Ayan on 09.12.23.
//

import UIKit
import SnapKit

    //MARK: -Protocol for Configure Cell function
protocol SearchCellProtocol {
    var movieTitle: String { get }
    var imagee: String { get }
    var overviewText: String { get }
    var imdbScore: Double { get }
}

class SearchCell: UITableViewCell {
    static let identifier = "SearchCell"
        
    // MARK: - UI Elements
    let moviePoster: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        image.clipsToBounds = true
        return image
    }()
    
    private let star: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = .orange
        image.clipsToBounds = true
        return image
    }()

    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "This is title"
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let imdbLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray3
        label.text = "7.7"
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let imdbMaxPointLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray2
        label.text = "/ 10 IMDB"
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .justified
        label.text = "This is movie overview his is movie overview his is movie overview his is movie overview his is movie overview his is movie overview his is movie overview his is movie overview"
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupUI()
      }
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          setupUI()
      }
    
    // MARK: - Lifecycle Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        moviePoster.image = nil
        titleLabel.text = nil
    }
   
    // MARK: - UI Configuration
    func setupUI() {
        addSubview(moviePoster)
        addSubview(titleLabel)
        addSubview(star)
        addSubview(imdbLabel)
        addSubview(imdbMaxPointLabel)
        addSubview(overviewLabel)
        setupConstraints()
    }
    
    //MARK: -Constraints
    func setupConstraints() {
        moviePoster.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(moviePoster.snp.right).offset(12)
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(16)
            make.width.equalTo(240)
        }
        
        star.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(24)
            make.left.equalTo(moviePoster.snp.right).offset(12)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        imdbLabel.snp.makeConstraints { make in
            make.left.equalTo(star.snp.right).offset(12)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(16)
        }
        
        imdbMaxPointLabel.snp.makeConstraints { make in
            make.left.equalTo(imdbLabel.snp.right).offset(2)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(16)
        }
        
        overviewLabel.snp.makeConstraints { make in
            make.left.equalTo(moviePoster.snp.right).offset(12)
            make.top.equalTo(imdbLabel.snp.bottom).offset(10)
            make.height.equalTo(80)
            make.width.equalTo(240)
        }
    }
    
    // MARK: - Cell Configuration
    func configureCell(data: SearchCellProtocol) {
        self.titleLabel.text = data.movieTitle
        self.imdbLabel.text = String(data.imdbScore)
        self.overviewLabel.text = data.overviewText
        self.moviePoster.loadImage(url: data.imagee)
    }
}
