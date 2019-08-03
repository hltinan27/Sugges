//
//  Storyboard.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation
import UIKit

internal protocol Storyboard {
    static func instantiate(from name: String) -> Self
}

extension Storyboard where Self: UIViewController {
    
    static func instantiate(from name: String) -> Self {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
