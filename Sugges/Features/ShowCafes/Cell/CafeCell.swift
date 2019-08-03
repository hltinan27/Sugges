//
//  CafeCell.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import UIKit

class CafeCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(item: Venues) {
        nameLabel.text = item.name
        cityLabel.text = item.location?.city
        
        let distance = String(format:"%.1f", item.distance!)
        distanceLabel.text = distance
    }

}
