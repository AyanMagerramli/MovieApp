//
//  ResusableCell.swift
//  MovieApp
//
//  Created by Ayan on 04.12.23.
//

import UIKit
import SnapKit
import SDWebImage

protocol HomeCellProtocol {
    var ttle: String {get}
    var img: String {get}
}

protocol PopularCellProtocol {
    var ttle: String {get}
    var img: String {get}
}

protocol UpcomingCellProtocol {
    var ttle: String {get}
    var img: String {get}
}

protocol TopratedCellProtocol {
    var ttle: String {get}
    var img: String {get}
}


class ResusableCell: UICollectionViewCell {
    var viewModel = HomeViewModel()
    var indexPath: IndexPath?

     private let titleLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .cyan
        return label
    }()
   
     private let image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        image.frame = .init(x: 0, y: 0, width: 167, height: 240)
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
        addSubview(image)
        addSubview(titleLabel)
        
        image.snp.makeConstraints {
            $0.height.equalTo(150)
            $0.width.equalTo(90)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(image.snp_bottomMargin).offset(10)
        }
        
        
        
        
    }
    
    func setupDataForWellcome (data: HomeCellProtocol) {
        image.sd_setImage(with: URL(string: data.img),completed: nil)
        titleLabel.text = data.ttle
//        print("MY CELL ISSSS \(viewModel.welcomeItem?.results?[indexPath?.row ?? 0].title ?? "no iteeem")")
//        print("RESULTS AREEE \(viewModel.welcomeItem?.results ?? [])")
    }
    
    func setupDataForPopular (data: PopularCellProtocol) {
        image.sd_setImage(with: URL(string: data.img),completed: nil)
        titleLabel.text = data.ttle
    }
    
    func setupDataForUpcoming (data: UpcomingCellProtocol) {
        image.sd_setImage(with: URL(string: data.img),completed: nil)
        titleLabel.text = data.ttle
    }
    
    func setupDataForToprated (data: TopratedCellProtocol) {
        image.sd_setImage(with: URL(string: data.img),completed: nil)
        titleLabel.text = data.ttle
    }
}
