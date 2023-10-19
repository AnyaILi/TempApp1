
//
//  TimePicker.swift
//  TempApp
//
//  Created by Anya Li on 9/24/23.
//

import SwiftUI

struct TimePicker: View {
    
    @Binding var currentDate : Date
    
    var body: some View {
        VStack {
            DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
            .labelsHidden()
            
        }
    }
}

#Preview {
    TimePicker(currentDate: .constant(Date()))
}
