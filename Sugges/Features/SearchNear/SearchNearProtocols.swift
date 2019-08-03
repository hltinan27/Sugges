//
//  SearchNearProtocol.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation

enum State<Data> {
    case loading
    case show(Data)
    case error(Error)
}

protocol SearchNearViewModelDelegate: class {
    func viewModelStateChanged(state: State<[Venues]>)
}
