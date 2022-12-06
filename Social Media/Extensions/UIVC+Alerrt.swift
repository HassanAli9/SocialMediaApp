//
//  UIVC+Alerrt.swift
//  Social Media
//
//  Created by Hassan on 04/06/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorAlert(message :String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}
