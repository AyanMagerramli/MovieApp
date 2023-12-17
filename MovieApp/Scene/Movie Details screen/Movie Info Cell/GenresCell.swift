//
//  GenresCell.swift
//  MovieApp
//
//  Created by Ayan on 17.12.23.
//

import UIKit
import SnapKit

class GenresCell: UICollectionViewCell {
    
    //MARK: Properties
    
    static let identifier = "GenresCell"
    
    //MARK: - UI Elements
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "genreTextColor")
        label.font = UIFont.boldSystemFont(ofSize: 8)
        return label
    }()
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        addSubview(label)
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
    
    //MARK: - Cell Data Configuration
    
    func configureCel(data: String) {
        label.text = data
    }
}
