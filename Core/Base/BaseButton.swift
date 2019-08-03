//
//  BaseButton.swift
//  Sugges
//
//  Created by Halit İNAN on 2.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class BaseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear
    {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var cornerrRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerrRadius
            clipsToBounds = true
        }
    }
}
