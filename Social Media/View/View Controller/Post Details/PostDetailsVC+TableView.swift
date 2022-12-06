//
//  PostDetailsVC+TableView.swift
//  Social Media
//
//  Created by Hassan on 04/06/2022.
//

import Foundation
import UIKit

extension PostDetailsVC : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentTVC.identifire) as! CommentTVC
        commentNumLabel.text = String(count!)
        if let comment = commentViewModel.getComment(at: indexPath){
            
            cell.commentOwnerImg.setImg(url: comment.owner.picture!)
            cell.commentLabel.text = comment.message
            cell.usernameLabel.text = comment.owner.firstName + " " + comment.owner.lastName
            
            
        }
        
        return cell
    }
    
    
}


extension PostDetailsVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
