//
//  SearchNearViewController.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class SearchNearViewController: BaseViewController {
    @IBOutlet weak var cityTextField: BaseTextField!
    var viewModel: SearchNearViewModel!
    var venueList: [Venues] = []
    var myCoordinate: CLLocation?
    
     let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Suggest Me"
        
        viewModel = SearchNearViewModel()
        viewModel.delegate = self
        locationManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cityTextField.text?.removeAll()
    }
    
    @IBAction func searcButtonAction(_ sender: Any) {
             viewModel.getNearCafes(city: cityTextField.text!)
    }
}

extension SearchNearViewController: SearchNearViewModelDelegate {
    func viewModelStateChanged(state: State<[Venues]>) {
        switch state {
        case .loading:
            self.isLoading = true
        case .show(let dataList):
            self.isLoading = false
            addDistance(listVenues: dataList)

        case .error(let error):
            self.alert(message: error.ErrorMessage, title: "Hata", actionButtonTitle: "Tamam")
            self.isLoading = false
        }
    }
    
    private func addDistance(listVenues: [Venues]) {
        venueList.removeAll()
        for var venue in listVenues {
            let distance = myCoordinate?.distance(from: CLLocation(latitude: venue.location!.lat!, longitude: venue.location!.lng!))
            venue.distance = distance! / 1000
            venueList.append(venue)
        }
        passToShowCafes(list: venueList)
    }
    
    private func passToShowCafes(list: [Venues]) {
        let showCafesViewController = ShowCefesViewController.instantiate(from: "SearchNear")
        showCafesViewController.venueList = list
        self.navigationController?.pushViewController(showCafesViewController, animated: true)
    }
}

extension SearchNearViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        myCoordinate = location
        locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        case .denied:
            self.alert(message: "No Location Permission", title: "Warning", actionButtonTitle: "Tamam")
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
}
