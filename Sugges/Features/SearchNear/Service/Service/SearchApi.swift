//
//  SearchApi.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//


import Foundation
import Moya

enum SearchApi {
    case near(String)
    case photos(String)
}

// TODO: parametreler body içeresinde gönderildiğinde aut hata

extension SearchApi: TargetType {
    var baseURL: URL {
        
        switch self {
        case .near(let city):
            let path = "https://api.foursquare.com/v2/venues/search?near=" + city + "&query=coffee&client_id=UEAGZ1CZQ0LTIJ4FKJR5ENCOCINXGINVFIZ4W1LXBQTAQMMK&client_secret=EPOIUKBHDUMLO3GQFN2UXPGRNTQIY32ZS4PZSNHQUTCAKMXD&v=20190802"
            return URL(string: path)!
        case .photos(let venueID):
            let path = "https://api.foursquare.com/v2/venues/" + venueID + "/photos?client_id=UEAGZ1CZQ0LTIJ4FKJR5ENCOCINXGINVFIZ4W1LXBQTAQMMK&client_secret=EPOIUKBHDUMLO3GQFN2UXPGRNTQIY32ZS4PZSNHQUTCAKMXD&v=20190802"
            return URL(string: path)!
        }
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        switch self {
        case .near:
            return .post
        case .photos:
            return .get
        }
    }
    
    var task: Task {
            return .requestPlain
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
