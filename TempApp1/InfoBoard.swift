//
//  InfoBoard.swift
//  TempApp1
//
//  Created by Anya Li on 10/19/23.
//

import SwiftUI
struct CheckToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundStyle(configuration.isOn ? Color(hex: "000000") : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}

struct InfoBoard: View {
    @EnvironmentObject var profileStore: ProfileStore
    @State var info = []
    @State var sunday = false
    @State var t = 0
    var body: some View {
        var n = ""
        ForEach(profileStore.profile) { profileItem in
            let title = profileItem.title
            Text(title)
//            checkTitle(title: n)
            
        }
        
        ZStack(alignment: .top){
            Color(hex: "CDD7B6")
                .ignoresSafeArea()
            ZStack{
                Color(hex: "EAECE3")
                    .cornerRadius(30)
                VStack{
                    ZStack(alignment: .leading){
                        Color(hex: "D9D9D9")
                            .cornerRadius(20)
                        Text("Info Board")
                            .font(.title)
                            .padding(.leading)
                    }
                    ZStack(alignment: .leading){
                        Color(hex: "CDD7B6")
                            .cornerRadius(20)
                        VStack{
                            Text("Info Board")
                                .font(.title)
                                .padding(.leading)
                            HStack{
                                Toggle(isOn: $sunday) {
                                    
                                    Text("")
                                    
                                }
                                .toggleStyle(CheckToggleStyle())
                                Text("S  ")
                                
                            }
                        }

                    }
                }
                .frame(width: 280.0, height: 50.0)
            }
            .padding(.top)
            .frame(width: 300.0, height: 600.0)
        }
    }
    func checkTitle(title: String){
        if(title == "Student"){
            t = 1
        }
    }
}

#Preview {
    InfoBoard().environmentObject(ProfileStore())
}
