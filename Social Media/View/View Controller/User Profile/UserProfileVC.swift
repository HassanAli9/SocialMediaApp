//
//  UserProfileVC.swift
//  Social Media
//
//  Created by Hassan on 07/06/2022.
//

import UIKit

class UserProfileVC: UIViewController {
    
    //MARK: OUTLET
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var countryCityLabel: UILabel!
  
    var id : String!
    var ownerVm : OwnerViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     ownerVm = OwnerViewModel()
     ownerVm.bindOwnerFromVMToVC = onSuccessSetData
     ownerVm.bindErrorFromVMToVC = onFailShowError
    ownerVm.fetchOwner(ownerId: id)
    }
    
    func onSuccessSetData()
    {
        
        userImg.setImg(url: ownerVm.owner.picture!)
        userImg.circuleImage()
        userNameLabel.text = ownerVm.owner.firstName + " " + ownerVm.owner.lastName
        emailLabel.text     = ownerVm.owner.email
        phoneLabel.text = ownerVm.owner.phone
        genderLabel.text = ownerVm.owner.gender
       
        
        guard let country = ownerVm.owner.location?.country , let city = ownerVm.owner.location?.city else {return}
        
        countryCityLabel.text = country + "/" + city
    }
    
    func onFailShowError()
    {
        showErrorAlert(message: ownerVm.errorMessage)
    }
   
}
