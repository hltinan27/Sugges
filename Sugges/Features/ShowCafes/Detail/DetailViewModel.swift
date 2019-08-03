//
//  DetailViewModel.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation

class DetailViewModel {
    let service = SearchService()
    weak var delegate: DetailViewModelDelegate?
}

extension DetailViewModel {
    func getNearCafes(_ venueId: String) {
        
        setState(state: .loading)
        service.getPhotos(venueId) { (response, error) in
            if error != nil {
                self.setState(state: .error(error!))
            } else {
                if response?.meta?.code == 200 {
                    let item = response?.response?.photos?.items?.first
                    let photoUrl = (item?.prefix)! + "original" + (item?.suffix)!
                    self.setState(state: .show(photoUrl))
                } else {
                    self.setState(state: .error(Error(errorCode: "0", errorMessage: (response?.meta?.errorDetail)!)))
                }
            }
        }
    }
    
    private func setState(state: State<String>) {
        delegate?.viewModelStateChanged(state: state)
    }
}
