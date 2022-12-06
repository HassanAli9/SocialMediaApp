//
//  PostTVC.swift
//  Social Media
//
//  Created by Hassan on 29/05/2022.
//

import UIKit

class PostTVC: UITableViewCell {

    // MARK: OUTLETS
    
    @IBOutlet weak var ownerSV: UIStackView!
    {
        didSet{
            ownerSV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ownerSVTapped)))
        }
    }
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postDetailsLabel: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var likesNumLabel: UILabel!
    @IBOutlet weak var commentsNumLabel: UILabel!
    
    @IBOutlet weak var mainView: UIView!
   
    
    static let identifire = "PostTVC"
    
    static func nib() -> UINib{
        return UINib(nibName: "PostTVC", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.circuleImage()
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func ownerSVTapped()
    {
        print("TAPPED")
        
        NotificationCenter.default.post(name: NSNotification.Name("ownerSVTapped"), object: nil, userInfo: ["cell" : self])
    }
    
}
