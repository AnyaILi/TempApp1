
//
//  TempApp1App.swift
//  TempApp1
//
//  Created by Anya Li on 10/19/23.
//


import MapKit
import SwiftUI
import UserNotifications

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    @State private var locationManager = CLLocationManager()
    @State private var region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054), radius: 1000, identifier: "Apple HQ")
    
//    @FetchRequest(entity: Profile1.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \Profile1.id, ascending: false) ])

    @EnvironmentObject var profileStore: ProfileStore
    var profile: ProfileItem? {
        profileStore.profile.count == 0 ? nil : profileStore.profile[0]
    }
    
    
    
//    for profileItem in profileItems{
//        viewModel = ContentViewModel(profileItem)
//    }

    var body : some View{
        NavigationStack{
            if(profile == nil){
                NewProfileView()
                //Test()
            }
            else{
                Homepage(profile: profile!)
            }
//            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
//                .ignoresSafeArea()
//                .onAppear(perform: {
//                    viewModel.checkIfLocationServicesIsEnabled()
//                })
//            VStack {
//                Button("Start Monitoring") {
//                    self.locationManager.startMonitoring(for: self.region)
//                    print("started")
//                }
//                
//                Button("Schedule Notification") {
//                    let content = UNMutableNotificationContent()
//                    content.title = "Feed the cat"
//                    content.subtitle = "It looks hungry"
//                    content.sound = UNNotificationSound.default
//                    
//                    // show this notification five seconds from now
//                    //                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//                    
//                    let date = Date().addingTimeInterval(5)
////                    let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//                    var dateComponents = DateComponents()
//                    dateComponents.calendar = Calendar.current
//
//
////                    dateComponents.weekday = 1
//                    dateComponents.hour = 21
//                    dateComponents.minute = 16
//                    
////                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//                    
//                    // choose a random identifier
//                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//                    
//                    // add our notification request
//                    UNUserNotificationCenter.current().add(request)
//                    print("done")
//                }
//            }
            
        }
        .onChange(of: scenePhase, initial: true) { oldPhase, newPhase in
             if newPhase == .inactive { saveAction() }
        }
        
    }
}

#Preview {
    ContentView(saveAction: {}).environmentObject(ProfileStore())
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
