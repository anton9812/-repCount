//
//  Utilities.swift
//  repCount
//
//  Created by Anton Samuilov on 20/10/2020.
//

import Foundation
//
//  Utilities.swift
//  PhotoPlan
//
//  Created by Anton Samuilov on 02/03/2020.
//  Copyright © 2020 Anton Samuilov. All rights reserved.
//




import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 8  , width: textfield.frame.size.width , height: 1)
         
        bottomLine.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 185/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func primaryText(label: UILabel){
        
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textColor = UIColor.black
        
    }
    static func grayText(label: UILabel){
        
        label.textColor =   UIColor.init(red: 96/255, green: 96/255, blue: 96/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 13.0)

        
        
    }
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1)
        //button.backgroundColor = UIColor.init(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        //button.layer.borderColor = UIColor.init(red: 131/255, green: 21/255, blue: 198/255, alpha: 1).cgColor
        button.tintColor = UIColor.white
        //button.layer.borderWidth = 2
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2.5
        button.layer.borderColor = UIColor.init(red: 0/255, green: 142/255, blue: 224/255, alpha: 1).cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    static func isEmailValid(_ email : String) -> Bool {
        
        let email1 = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return email1.evaluate(with: email)
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
