//
//  MoviePosterCell.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import UIKit

class MoviePosterCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
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
}
