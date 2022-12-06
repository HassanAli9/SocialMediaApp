//
//  LogInVC.swift
//  Social Media
//
//  Created by Hassan on 10/06/2022.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    
    @IBOutlet weak var email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstName.delegate = self
        email.delegate = self
    }
    

   

}


extension LoginVC : UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        switch textField
        {
        case firstName:
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.systemTeal.cgColor
            
            
        case email:
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.systemTeal.cgColor
            
        default:
            print("")
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField
        {
        case firstName:
            textField.layer.borderWidth = 0
    
        case email:
            textField.layer.borderWidth = 0
            
        default:
            print("")
        }
    }
}
