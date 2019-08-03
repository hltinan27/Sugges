//
//  Photos.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation

struct PhotosResponse: Codable {
    var response: Photos?
    var meta: Meta?
}

struct Photos: Codable {
    var photos: Photo?
}

struct Photo: Codable {
    var items: [Item]?
}

struct Item: Codable {
    var prefix: String?
    var suffix: String?
}
