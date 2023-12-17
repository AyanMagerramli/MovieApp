//
//  MoviePosterCell.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import UIKit
//MARK: -CELL Data Configure Protocol
protocol MoviePosterCellProtocol {
    var image: String {get}
}

class MoviePosterCell: UICollectionViewCell {
    
    //MARK: Properties
    
    static let identifier = "MoviePosterCell"
    
    //MARK: - UI Elements
    
     let image: UIImageView = {
        let image = UIImageView()
         image.clipsToBounds = true
         image.contentMode = .scaleToFill
        return image
    }()
    
    //MARK: - Setup UI
    
    private func setupUI() {
        image.frame = contentView.bounds
        addSubview(image)
    }
    
    //MARK: - Lifecycle methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cell data configure
    
    func configureCell(data: String) {
        print("Poster Path: \(data)")
        image.loadImage(url: data)
    }
}
