//
//  SceneDelegate.swift
//  TempApp1
//
//  Created by Anya Li on 10/22/23.
//

import SwiftUI

struct SceneDelegate: View {
    var body: some View {
        let locationSearchService = LocationSearchService()
        let contentView = AddressPicker(locationSearchService: locationSearchService)

    }
}

#Preview {
    SceneDelegate()
}
