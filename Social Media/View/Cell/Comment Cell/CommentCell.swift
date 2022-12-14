//
//  CommentTVC.swift
//  Social Media
//
//  Created by Hassan on 02/06/2022.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var v: UIView!
    @IBOutlet weak var commentOwnerImg: UIImageView!
        @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    static let identifier = "CommentCell"

    static func nib() -> UINib{
        return UINib(nibName: "CommentCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
        commentOwnerImg.circleImage()
        
        
        v.layer.shadowColor = UIColor.gray.cgColor
        v.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        v.layer.shadowOpacity = 1.0
        v.layer.masksToBounds = false
        v.layer.cornerRadius  = 2.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
