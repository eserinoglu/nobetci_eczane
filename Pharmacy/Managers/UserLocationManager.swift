//
//  UserLocationManager.swift
//  Pharmacy
//
//  Created by Ethem Serinoğlu on 27.05.2024.
//

import Foundation
import CoreLocation
import MapKit
import _MapKit_SwiftUI

class UserLocationManager : NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    
    @Published var userLocation : CLLocation?
    @Published var isAuthorized = false
    
    override init(){
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        self.userLocation = manager.location
    }
    
    func requestAccess(){
        if let url = URL(string: UIApplication.openSettingsURLString){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            self.isAuthorized = true
            manager.startUpdatingLocation()
        case .authorizedWhenInUse:
            self.isAuthorized = true
            manager.startUpdatingLocation()
        case .authorized:
            self.isAuthorized = true
            manager.startUpdatingLocation()
        default :
            self.isAuthorized = false
            self.userLocation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.userLocation = location
        }
    }
}
