//
//  Homepage.swift
//  TempApp
//
//  Created by Anya Li on 9/30/23.
//

import SwiftUI

struct Homepage: View {
    var profile = ProfileItem(name: "", title: "", startTime: Foundation.Date())
    @StateObject private var viewModel: ContentViewModel

    init(profile: ProfileItem){
        _viewModel = StateObject(wrappedValue: ContentViewModel(profile: profile))

    }
    var body: some View {
        ZStack{
            Color(hex: "CDD7B6")
                .ignoresSafeArea()
            VStack{
                Image(systemName: "clock")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 150.0)
                Text("Welcome!")
                    .font(.custom("KosugiMaru-Regular", size: 27))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color(hex: "8b8b8b"))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color(hex: "eaece2"))
                    .mask(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius:5)
                    .padding()
                
                NavigationLink(destination: InfoBoard()) {
                     HStack{
                       VStack(alignment: .leading){
                         Text("Info Board")
                               .font(.custom("KosugiMaru-Regular", size: 27))
                           .foregroundColor(Color(hex: "8b8b8b"))
                           
                    }
                       .frame(maxWidth: .infinity, alignment: .leading)
                       Image(systemName: "chevron.right")
                         .foregroundColor(Color.black)
                     }
                     .padding(.horizontal, 30)
                     .padding(.vertical, 10)
                     .background(Color(hex: "eaece2"))
                     .mask(RoundedRectangle(cornerRadius: 20))
                     .shadow(radius:5)
                   }
                   .padding()

                NavigationLink(destination: Profile()) {
                     HStack{
                       VStack(alignment: .leading){
                         Text("Profile")
                               .font(.custom("KosugiMaru-Regular", size: 27))
                           .foregroundColor(Color(hex: "8b8b8b"))
                           
                    }
                       .frame(maxWidth: .infinity, alignment: .leading)
                       Image(systemName: "chevron.right")
                         .foregroundColor(Color.black)
                     }
                     .padding(.horizontal, 30)
                     .padding(.vertical, 10)
                     .background(Color(hex: "eaece2"))
                     .mask(RoundedRectangle(cornerRadius: 20))
                     .shadow(radius:5)
                   }
                   .padding()

            }
        }
        
    }
}

#Preview {
    Homepage(profile: ProfileItem(name: "", title: "", startTime: Foundation.Date()))
}
