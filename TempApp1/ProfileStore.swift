//
//  ProfileStore.swift
//  TempApp
//
//  Created by Anya Li on 10/15/23.
//

import Foundation
/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

@MainActor
class ProfileStore: ObservableObject {
    @Published var profile: [ProfileItem] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        let task = Task<[ProfileItem], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let dailyScrums = try JSONDecoder().decode([ProfileItem].self, from: data)
            return dailyScrums
        }
        let profile = try await task.value
        self.profile = profile
    }
    
    func save(scrums: [ProfileItem]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
