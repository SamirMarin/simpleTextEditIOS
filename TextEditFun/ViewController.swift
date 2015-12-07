//
//  ViewController.swift
//  TextEditFun
//
//  Created by Samir Marin on 2015-12-03.
//  Copyright © 2015 Samir Marin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipCodeText: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockSwitch: UISwitch!
    
    //delegate objects
    let zipCodeTextDelegate = ZipCodeTextDelegate()
    let cashTextDelegate = CashTextFieldDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipCodeText.delegate = zipCodeTextDelegate
        cashTextField.delegate = cashTextDelegate
        lockableTextField.delegate = self
        
        lockSwitch.setOn(false, animated: false)
        
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return lockSwitch.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func switchLock(sender: UISwitch) {
        if (!sender.on){
            lockableTextField.resignFirstResponder()
        }
    }
}

