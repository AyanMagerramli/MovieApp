//
//  Extensions.swift
//  MovieApp
//
//  Created by Ayan on 07.12.23.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func loadImage(url: String) {
        if let finalUrl = URL(string: NetworkHelper.imagePath + url) {
            self.sd_setImage(with: finalUrl)
        }
    }
}
