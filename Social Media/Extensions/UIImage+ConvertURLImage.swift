//
//  ConvertURLImage.swift
//  Social Media
//
//  Created by Hassan on 02/06/2022.
//

import Foundation
import UIKit
extension UIImageView
{
    func setImg(url : String)
    {
        if let urlPostImg = URL(string: url)
        {
            let data = try! Data(contentsOf: urlPostImg)
            self.image = UIImage(data: data)
        }
    }
    
    func circuleImage()
    {
        self.layer.cornerRadius = self.frame.height / 2
    }
}

