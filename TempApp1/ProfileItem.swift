//
//  ProfileItem.swift
//  TempApp
//
//  Created by Anya Li on 9/23/23.
//

import Foundation
class ProfileItem: Identifiable, Codable{
    
    var title : String
    var id = UUID()
    var name : String
    var startTime: Date
    var endTime: Date
    
    
    init(name: String, title: String, startTime: Date, endTime: Date){
        self.title = title
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
    }
}
