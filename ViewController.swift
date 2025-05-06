//
//  ViewController.swift
//  LocateArea
//
//  Created by kazunori.sakata.ts on 2024/10/22.
//

import Foundation
import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // 向き情報の更新を開始
        locationManager.startUpdatingHeading()
    }

    // 位置情報が更新されたときに呼ばれるメソッド
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            
            // 位置情報と向きを固定したデータを使ったシミュレーション
            simulateFixedEastHeading()
        }
    }

    // 位置情報の取得が失敗したときに呼ばれるメソッド
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    // コンパス（向き）情報が更新されたときに呼ばれるメソッド
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("Current heading: \(newHeading.trueHeading) degrees")
    }
    
    // 東側方向をシミュレートするメソッド
    func simulateFixedEastHeading() {
        let fixedHeading = 90.0 // 東側を指す角度
        print("Simulated heading: \(fixedHeading) degrees")
    }
}

