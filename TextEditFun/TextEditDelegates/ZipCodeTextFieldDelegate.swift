//
//  zipCodeTextFieldDelegate.swift
//  TextEditFun
//
//  Created by Samir Marin on 2015-12-04.
//  Copyright © 2015 Samir Marin. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextDelegate: NSObject, UITextFieldDelegate{
    
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Construct the text that will be in the field if this change is accepted
        var newText = textField.text! as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        if(newText.length < 6){
            return true
        }
        else{
            return false
        }
        
    }
    
}


