//
//  DetailProtocols.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation

protocol DetailViewModelDelegate: class {
    func viewModelStateChanged(state: State<String>)
}
