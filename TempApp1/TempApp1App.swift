//
//  TempAppApp.swift
//  TempApp
//
//  Created by Anya Li on 8/19/23.
//

import SwiftUI

@main
struct TempAppApp: App {
    @StateObject private var store = ProfileStore()
//    let persistenceController = PersistenceController.shared
//    init(){
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound, .badge]) {result, error in if let error = error {
//                print(error)
//            }
//        }
//    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)//.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
