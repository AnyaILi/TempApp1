//
//  AddressPicker.swift
//  TempApp1
//
//  Created by Anya Li on 10/22/23.
//

import SwiftUI
import MapKit

struct AddressPicker: View {

    @ObservedObject var locationSearchService: LocationSearchService
    @Environment(\.dismiss) var dismiss
    var body: some View {
//        NavigationView {
            VStack {
                HStack{
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                    .padding([.top, .trailing])
                }
                SearchBar(text: $locationSearchService.searchQuery)
                List{
                    
                    ForEach(locationSearchService.completions) { completion in
                        
                        Button(action:{
                                dismiss()
                            }){
                            VStack(alignment: .leading) {
                                Text(completion.title)
                                Text(completion.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                        
            //            }
                    
        }
    }

//    private func didTapOnCompletion(_ completion: MKLocalSearchCompletion) {
//        InfoBoard()
//    }
}

#Preview {
    AddressPicker(locationSearchService: LocationSearchService())
}
