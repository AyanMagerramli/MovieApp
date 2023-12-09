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
    
    }
    
    private let image: UIImageView = {
       let image = UIImageView()
       image.layer.cornerRadius = 16
       image.layer.masksToBounds = true
       image.contentMode = .scaleAspectFill
      // image.frame = .init(x: 0, y: 0, width: 167, height: 240)
       image.clipsToBounds = true
       return image
   }()
    
//    func setupConstraints() {
//        image.snp.makeConstraints { make in
//            make.left.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
//        }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
