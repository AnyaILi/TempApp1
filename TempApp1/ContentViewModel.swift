//
//  ContentViewModel.swift
//  TempApp
//
//  Created by Anya Li on 8/29/23.
//
import MapKit
import UserNotifications
enum MapDetails{
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}
final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    var profile: ProfileItem
    init(profile: ProfileItem){
        self.profile = profile
        self.locationManager?.allowsBackgroundLocationUpdates = true
        self.locationManager?.showsBackgroundLocationIndicator = true
    }
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
        }
        else{
            print("Show an alert letting them know this is off")
        }
    }
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus{
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go to settings to change it.")
        case .authorizedAlways,.authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion){
        let content = UNMutableNotificationContent()
        content.title = "Test"
        content.subtitle = "Work"
        content.sound = UNNotificationSound.default

        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current


//                    dateComponents.weekday = 1
//        dateComponents.hour = ProfileItem.startingTime.hour
//        dateComponents.minute = ProfileItem.startingTime.minute
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        // show this notification five seconds from now
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

