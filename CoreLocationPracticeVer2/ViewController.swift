//
//  ViewController.swift
//  CoreLocationPracticeVer2
//
//  Created by Bryan Kuo on 2022/6/27.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        
        // Do any additional setup after loading the view.
    }
    @IBAction func getLocation(_ sender: UIButton) {
        
        locationManager.requestLocation()
        
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last!.coordinate
        print(location.longitude)
        locationLabel.text = "目前位置為\n經度為\(location.longitude)\n緯度為\(location.latitude)"
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("fail")
    }
}
