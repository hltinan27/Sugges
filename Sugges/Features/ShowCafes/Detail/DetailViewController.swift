//
//  DetailViewController.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation
import MapKit
import Kingfisher

class DetailViewController: BaseViewController {
    var venue: Venues?
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var popupView: UIStackView!
    
    let regionInMeters: Double = 5000
    var coordinate: CLLocationCoordinate2D?
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DetailViewModel()
        viewModel.delegate = self
        viewModel.getNearCafes(venue!.id!)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        self.view.addGestureRecognizer(recognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addMapRegion()
    }
    
    private func addPhoto(_ imageURL: String) {
        let url = URL(string: imageURL)
        imageView.kf.setImage(with: url)
    }

    @objc func dismissPopup(sender: UITapGestureRecognizer) {
        if (sender.state == UIGestureRecognizer.State.ended) {
            let location: CGPoint = sender.location(in: self.view)
            
            if (self.popupView.point(inside: location, with: nil)) {
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func viewModelStateChanged(state: State<String>) {
        switch state {
        case .loading:
            self.isLoading = true
        case .show(let photoStringURL):
            self.isLoading = false
            addPhoto(photoStringURL)
        case .error(let error):
            self.alert(message: error.ErrorMessage, title: "Hata", actionButtonTitle: "Tamam")
            self.isLoading = false
        }
    }
}

extension DetailViewController {
    
    private func addPin() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate!
        mapView.addAnnotation(annotation)
    }
    
    private func addMapRegion() {
        coordinate = CLLocationCoordinate2D(latitude: (venue?.location!.lat)!, longitude: (venue?.location!.lng)!)
        let region = MKCoordinateRegion.init(center: coordinate!, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
        
        addPin()
    }
}
