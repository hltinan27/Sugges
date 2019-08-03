//
//  SearchNearViewModel.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation

class SearchNearViewModel {
   let service = SearchService()
   weak var delegate: SearchNearViewModelDelegate?
    var selectedCity: String = ""
}

extension SearchNearViewModel {
    func getNearCafes(city: String) {
        
        if city.isEmpty {
            selectedCity = "istanbul"
        } else {
            selectedCity = city
        }
       
        setState(state: .loading)
        service.getNearSuggest(selectedCity) { (response, error) in
            if error != nil {
                self.setState(state: .error(error!))
            } else {
                if response?.meta?.code == 200 {
                    self.setState(state: .show((response?.response?.venues)!))
                } else if response?.meta?.code == 400 {
                    self.setState(state: .error(Error(errorCode: "0", errorMessage: (response?.meta?.errorDetail)!)))
                }
            }
        }
    }
    
    private func setState(state: State<[Venues]>) {
        delegate?.viewModelStateChanged(state: state)
    }
}
