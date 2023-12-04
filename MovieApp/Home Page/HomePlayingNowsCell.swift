//
//  HomeCell.swift
//  MovieApp
//
//  Created by Ayan on 03.12.23.
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

class HomePlayingNowsCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    var viewModel = HomeViewModel()
    var indexPath: IndexPath?
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        configureUI()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //this type of uiElement initilazing is called self executing closure
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .red
        return label
    }()
    //  () - at the end: This immediately invokes the closure, ensuring that the titleLabel property is assigned the result of the closure execution, which is the configured UILabel` instance.
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        image.frame = .init(x: 0, y: 0, width: 167, height: 240)
        image.clipsToBounds = true
        return image
    }()
    
    private func configureUI() {
        let stack = UIStackView()
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(titleLabel)
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        
       //setting constraints
        stack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.bottom.equalToSuperview().inset(0)
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
