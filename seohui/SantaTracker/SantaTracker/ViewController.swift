//
//  ViewController.swift
//  SantaTracker
//
//  Created by seohui on 19/05/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift

class ViewController: UIViewController {

    // MARK: IBOulets
    @IBOutlet private weak var timeRemainingLabel: UILabel!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var activityLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var presentsRemainingLabel: UILabel!
    
    private var mapManager: MapManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the map manager
        // TODO: implicitly unwrapped?? So here we set up the map manager, which unfortunately has to be implicitly unwrapped, because it needs the reference to the map view. (I know this could be architected differently for now to remove this problem, but we’ll need this in a later part of this tutorial and it’s easier to minimize refactoring since I have psychic knowledge of what the future will hold.)
        mapManager = MapManager(mapView: mapView)
        
        // Find the Santa data in Realm
        let realm = try! Realm()
        let santas = realm.objects(Santa.self)
        
        // Setup the test Santa if he's already there
        if santas.isEmpty {
            try? realm.write {
                realm.add(Santa.test())
            }
        }
        
        // Be responsible in unwrapping!
        if let santa = santas.first {
            // Updata the map
            mapManager.update(with: santa)
        }
    }
}

