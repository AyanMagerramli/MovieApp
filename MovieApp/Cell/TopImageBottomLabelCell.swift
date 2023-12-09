//
//  ResusableCell.swift
//  MovieApp
//
//  Created by Ayan on 04.12.23.
//

import UIKit
import SnapKit

//MARK: -CELL Data Configure Protocols
protocol HomeCellProtocol {
    var ttle: String {get}
    var img: String {get}
}

//MARK: -NestedCollectionCell within collection view in HomeCell
class TopImageBottomLabelCell: UICollectionViewCell {
    static let identifier = "NestedCollectionCell"
    var indexPath: IndexPath?

     private let titleLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
   
     private let image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
       // image.frame = .init(x: 0, y: 0, width: 167, height: 240)
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        configureUI()
     }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        titleLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp_bottomMargin).offset(10)
            make.leading.equalToSuperview().inset(12)
        }
        
        image.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview().inset(16)
        }
    }
  
//MARK: - CELL data configure method
    func configureCell (data: HomeCellProtocol) {
        image.loadImage(url: data.img)
        titleLabel.text = data.ttle
    }
}
