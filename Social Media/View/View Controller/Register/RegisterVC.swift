//
//  RegisterVC.swift
//  Social Media
//
//  Created by Hassan on 10/06/2022.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    let vmOwner = OwnerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstName.delegate = self
        email.delegate = self
        lastName.delegate = self
        
        vmOwner.bindErrorFromVMToVC = onFailUpdateView
        vmOwner.bindStateFromVMToVC = onStateShowAlert

    }
    
    func onFailUpdateView()
    {
        showErrorAlert(message: vmOwner.errorMessage)
    }
    
    func onStateShowAlert()
    {
        if vmOwner.state
        {
            let alert = UIAlertController(title: "Success", message: "Owner Created", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    

    @IBAction func logInBtn(_ sender: Any) {
        
        vmOwner.createOwner(firstName: firstName.text!, lastName: lastName.text!, email: email.text!)
    }
    

}


extension RegisterVC : UITextFieldDelegate
{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        switch textField
        {
        case firstName:
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.systemTeal.cgColor
            
            
        case lastName:
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
            //textField.layer.borderColor = UIColor.systemTeal.cgColor
            
            
        case lastName:
            textField.layer.borderWidth = 0
           // textField.layer.borderColor = UIColor.systemTeal.cgColor
            
        case email:
            textField.layer.borderWidth = 0
           // textField.layer.borderColor = UIColor.systemTeal.cgColor
            
        default:
            print("")
        }
    }
    
}
