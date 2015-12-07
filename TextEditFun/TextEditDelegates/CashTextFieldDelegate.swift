//
//  CashTextFieldDelegate.swift
//  TextEditFun
//
//  Created by Samir Marin on 2015-12-04.
//  Copyright © 2015 Samir Marin. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate{
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Construct the text that will be in the field if this change is accepted
        let textNS = textField.text! as NSString
        var newText = textNS.stringByReplacingCharactersInRange(range, withString: string)
        var newTextString = String(newText)
        
        let nums = NSCharacterSet.decimalDigitCharacterSet()
        var numStrings = ""
        for n in newTextString.unicodeScalars{
            if nums.longCharacterIsMember(n.value){
                numStrings.append(n)
            }
        }
        
        //format the new string
        if let numStringInt = Int(numStrings){
            newText = "$" + theDollars(numStringInt) + "." + theCents(numStringInt)
            
        }else{
            newText = "$0.00"
        }
        textField.text = newText
        return false
        
    }
    // textField.text = newText
    
    func theDollars(nums: Int) ->String{
        return String(nums/100)
    }
    
    func theCents(nums: Int)-> String{
        let centNum = nums % 100
        var centString = String(centNum)
        
        if (centNum < 10){
            centString = "0" + centString
        }
        
        return centString
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField.text!.isEmpty){
            textField.text = "$0.00"
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

    
}
