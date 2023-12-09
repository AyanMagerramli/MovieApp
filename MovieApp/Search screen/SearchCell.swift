//
//  SearchCell.swift
//  MovieApp
//
//  Created by Ayan on 09.12.23.
//

import UIKit
import SnapKit

class SearchCell: UITableViewCell {

    static let identifier = "SearchCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupUI()
      }
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          setupUI()
      }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        moviePoster.image = nil
        titleLabel.text = nil
    }
    
    let moviePoster: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        image.clipsToBounds = true
        return image
    }()
    
    private let star: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = .orange
        image.clipsToBounds = true
        return image
    }()

    
    private let titleLabel: UILabel = {
        let label = UILabel()
       // label.font = UIFont.systemFont(ofSize: 12)
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
    
    func setupUI() {
        addSubview(moviePoster)
        addSubview(titleLabel)
        addSubview(star)
        addSubview(imdbLabel)
        addSubview(imdbMaxPointLabel)
        addSubview(overviewLabel)
        setupConstraints()
    }
    
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
}
