//
//  SearchService.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation

class SearchService: MoyaWrapper<SearchApi> {
    
    func getNearSuggest(_ city : String?, completion: @escaping (NearSuggestResponse?, Error?) -> Void)  {
        self.request(.near(city!), completion: completion)
    }
    
    func getPhotos(_ venueID : String?, completion: @escaping (PhotosResponse?, Error?) -> Void)  {
        self.request(.photos(venueID!), completion: completion)
    }
}
