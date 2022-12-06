//
//  UIViewEffect.swift
//  Social Media
//
//  Created by Hassan on 02/06/2022.
//

import UIKit

class ShadowView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.viewEffect()
    }

    func viewEffect() {
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 10
        self.layer.shadowRadius = 10
    }
}
