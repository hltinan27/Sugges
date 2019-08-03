//
//  BaseViewController.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, Storyboard {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var isLoading = false {
        didSet {
            if isLoading {
                Indicator.start(from: self.view)
            } else {
                Indicator.stop()
            }
        }
    }
}

extension UIViewController {
    func alert(message: String, title: String ,actionButtonTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: actionButtonTitle, style: .default, handler: nil)
        alertController.addAction(actionButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
