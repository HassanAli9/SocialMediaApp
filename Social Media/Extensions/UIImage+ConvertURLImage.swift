//
//  ConvertURLImage.swift
//  Social Media
//
//  Created by Hassan on 02/06/2022.
//

import Foundation
import Kingfisher
extension UIImageView {
    func setImg(url: String) {
        self.kf.setImage(with: URL(string: url)!)
    }

    func circleImage() {
        self.layer.cornerRadius = self.frame.height / 2
    }
}
