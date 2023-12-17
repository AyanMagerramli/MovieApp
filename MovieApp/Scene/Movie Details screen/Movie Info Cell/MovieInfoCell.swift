//
//  MovieInfoCell.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import UIKit
import SnapKit

class MovieInfoCell: UICollectionViewCell {
    
    //MARK: Properties
    
    static let identifier = "MovieInfoCell"
    var genres: [Genre] = []
    var movieID: Int?
    var viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Elements
    
    private lazy var genresCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(GenresCell.self, forCellWithReuseIdentifier: GenresCell.identifier)
        return collection
    }()
    
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
            make.top.equalToSuperview().inset(4)
            make.leading.equalToSuperview().inset(24)
        }
        
        genresCollection.snp.makeConstraints { make in
            make.top.equalTo(ratingStackView.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(22)
            make.width.equalToSuperview()
        }
        
        generalStackView.snp.makeConstraints { make in
            make.top.equalTo(genresCollection.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(24)
        }
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        setupStackView()
        addSubview(genresCollection)
        addSubview(ratingStackView)
        addSubview(generalStackView)
        setupConstraints()
    }
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        self.viewModel = MovieDetailViewModel(movieID: self.movieID ?? 28)
        super.init(frame: frame)
        setupUI()
      
            self.viewModel.getGenres { genres in
                self.genresCollection.reloadData()
                self.genres = genres
            }

        viewModel.getDetail {
            self.genresCollection.reloadData()
        }
    }
    
    //MARK: - Cell Data Configuration
    func configureCell(data: MovieInfoModel) {
        ratingLabel.text = "\(data.rating)"
        rating2Point.text = "\(data.rating)/10 IMDB"
        durationLength.text = "\(data.length) min"
        languageType.text = data.language
    }
}

    //MARK: - Data Source

extension MovieInfoCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenresCell.identifier, for: indexPath) as! GenresCell
        cell.backgroundColor = UIColor(named: "genreBackground")
        cell.layer.cornerRadius = 10
        cell.configureCel(data: genres[indexPath.row].name ?? "")
        return cell
    }
}

    //MARK: - Delegate

extension MovieInfoCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 80, height: collectionView.frame.height-4)
    }
}
