//
//  PostTVC.swift
//  Social Media
//
//  Created by Hassan on 29/05/2022.
//

import UIKit

class PostCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet var ownerSV: UIStackView! {
        didSet {
            ownerSV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ownerSVTapped)))
        }
    }

    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var postDetailsLabel: UILabel!
    @IBOutlet var postImg: UIImageView!
    @IBOutlet var likesNumLabel: UILabel!
    @IBOutlet var commentsNumLabel: UILabel!
    @IBOutlet var mainView: UIView!
   
    static let identifier = "PostCell"
    static let nib = UINib(nibName: "PostCell", bundle: nil)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.circleImage()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func ownerSVTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("ownerSVTapped"), object: nil, userInfo: ["cell": self])
    }
}
