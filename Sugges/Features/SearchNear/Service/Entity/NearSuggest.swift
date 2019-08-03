//
//  NearSuggest.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation

struct NearSuggestRequest: Codable {
      var near = "istanbul"
    
    init() { }
}


struct NearSuggestResponse: Codable {
    var response: Response?
    var meta: Meta?
}

struct Meta: Codable {
    var code: Double?
    var errorDetail: String?
    
    init() { }
}

struct Response: Codable {
    var venues: [Venues]?
}

struct Venues: Codable {
    var id: String?
    var name: String?
    var location: Location?
    var distance: Double?
    
    init() { }
    
    mutating func addDistance(_distance: Double) {
        distance = _distance
    }
}

struct Location: Codable {
    var lat: Double?
    var lng: Double?
    var city: String?
    
}
