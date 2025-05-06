//
//  ContentView.swift
//  LocateArea
//
//  Created by kazunori.sakata.ts on 2024/10/22.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager() // LocationManagerのインスタンスを生成
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Current location: \(location.latitude), \(location.longitude)")
                    .padding()
            } else {
                Text("Acquiring location...")
                    .padding()
            }
        }
        .onAppear {
            locationManager.requestLocation() // コンテンツビューが表示されたときに位置情報をリクエスト
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()  // CLLocationManagerのインスタンス
    @Published var location: CLLocationCoordinate2D? // 位置情報を保持するPublishedプロパティ
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        locationManager.requestLocation()  // 位置情報のリクエスト
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate // 最初の位置情報を取得
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
