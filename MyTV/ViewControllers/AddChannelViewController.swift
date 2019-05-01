//
//  AddChannelViewController.swift
//  MyTV
//
//  Created by Andre Heß on 01.05.19.
//  Copyright © 2019 Andre Heß. All rights reserved.
//

import UIKit

class AddChannelViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var channelNameField: UITextField!
    @IBOutlet weak var channelUrlField: UITextField!
    @IBOutlet weak var channelTeletextUrlField: UITextField!
    @IBOutlet weak var optionalLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // Button handling
    
    @IBAction func doneButtonTouched(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTouched(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    // Textfield handling
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if textField == channelNameField || textField == channelUrlField {
            return true
        }
        
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == channelNameField {
//            channelUrlField.becomeFirstResponder()
//        } else if textField ==
        switch textField {
        case channelNameField:
            channelUrlField.becomeFirstResponder()
        case channelUrlField:
            channelTeletextUrlField.becomeFirstResponder()
        default:
            break
        }
    }
}
