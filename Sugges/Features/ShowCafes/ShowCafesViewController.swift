//
//  ShowCafesViewController.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation
import UIKit

class ShowCefesViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    var venueList: [Venues] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Coffee Shops"
    }
    
    private func passToDetail(_ venue: Venues) {
        let detailViewController = DetailViewController.instantiate(from: "SearchNear")
        detailViewController.venue = venue
        detailViewController.modalPresentationStyle = .overCurrentContext
        self.navigationController!.present(detailViewController, animated: true)
    }
}

extension ShowCefesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let venueId = venueList[indexPath.row]
        passToDetail(venueId)
    }
}

extension ShowCefesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venueList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CafeCell", for: indexPath) as! CafeCell
        cell.configure(item: venueList[indexPath.row])
        return cell
    }
}
