//
//  TVAlert.swift
//  MyTV
//
//  Created by Andre Heß on 01.05.19.
//  Copyright © 2019 Andre Heß. All rights reserved.
//

import UIKit

class TVAlert {

    static func showAlert(title: String?, message: String?, onVC: UIViewController, onDismiss: ((Int) -> Void)?, onCancel: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
            guard let usedActionIndex = alertController.actions.firstIndex(of: action) else { return }
            onDismiss?(usedActionIndex)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action: UIAlertAction) in
            onCancel?()
        }
        
        alertController.addAction(dismissAction)
        alertController.addAction(cancelAction)
        
        onVC.present(alertController, animated: true, completion: nil)
    }
}
