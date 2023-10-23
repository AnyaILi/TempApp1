
//
//  NewProfileView.swift
//  TempApp
//
//  Created by Anya Li on 9/23/23.
//

import SwiftUI

struct NewProfileView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var profileStore: ProfileStore
    @State var title: String=""
    @State var name: String=""
    @State private var selection = "Student"
    @State private var startTime : Date = Date()
    @State private var endTime : Date = Date()
    @State private var isShowingSheet = false
    let titles = ["Student", "Office Worker", "Home makers"]
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack{
                Text("Profile")
                    .font(.custom("KosugiMaru-Regular", size: 40))
                    .fontWeight(.bold)
                TextField("Enter your name", text: $name)
                    .font(.custom("KosugiMaru-Regular", size: 20))
                    .padding()
                    .background(Color(hex: "CDD7B6"))
                    .cornerRadius(15)
                    .padding()
                
                //                Menu("Title") {
                //                    Text("Student")
                //                    Text("Office Worker")
                //                    Text("Menu Item 3")
                //                }
                //                .menuStyle(MenuButtonStyle())
                Picker(
                    selection: $selection,
                    label:
                        HStack{
                            Text("Title: ")
                            Text(selection)
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color(hex: "CDD7B6"))
                        .cornerRadius(10)
                    ,
                    content: {
                        ForEach(titles, id: \.self){ option in
                            HStack{
                                Text(option)
                            }
                            .tag(option)
                        }
                    })
                .pickerStyle(.inline)
                
                //                Text("Selected Title: \(selection)")
                if(selection == "Student"){
                    VStack{
                        Text("School Start Time:")
                        TimePicker(currentDate: $startTime)
                            .padding()
                        Text("School End Time:")
                        TimePicker(currentDate: $endTime)
                            .padding()
                        Button("School Address", action: {isShowingSheet.toggle()})
                            .buttonStyle(.bordered)
                            .foregroundColor(.black)
                            .tint(.gray)
                        
//                        Button(action: {
//                            isShowingSheet.toggle()
//                        })
//                        {
//                            Text("Show License Agreement")
//                        }
//                        VStack {
////                            Text("License Agreement")
////                                .font(.title)
////                                .padding(50)
////                            Text("""
////                                                Terms and conditions go here.
////                                            """)
////                            .padding(50)
//                            Button("Dismiss",
//                                   action: { isShowingSheet.toggle() })
//                            
//                        }
                    }
                    
                }
                else if(selection == "Office Worker"){
                    VStack{
                        Text("Work Start Time:")
                        TimePicker(currentDate: $startTime)
                            .padding()
                        Text("Work End Time:")
                        TimePicker(currentDate: $endTime)
                            .padding()
                    }
                    
                }
                NavigationLink("Add"){
                    Homepage(profile: ProfileItem(name: self.name, title: self.title, startTime: self.startTime, endTime: self.endTime))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    
                }
                .foregroundColor(Color.black)
                .buttonStyle(.borderedProminent)
                .tint(Color(hex: "F6EFE8"))
                .cornerRadius(10)
                .simultaneousGesture(TapGesture().onEnded {
                    profileStore.profile.append(ProfileItem(name: self.name, title: self.title, startTime: self.startTime, endTime: self.endTime))
                })
                
                
            }
        }
        .sheet(isPresented: $isShowingSheet){
            AddressPicker(locationSearchService: LocationSearchService())
        }
    }
    
    func didDismiss() {
        // Handle the dismissing action.
    }
    private func addTask(name: String, title: String, startTime: Date, endTime: Date) {
        
        //        let task = Profile1(context: context)
        //        task.id = UUID()
        //        task.title = title
        //        task.name = name
        //        task.startTime = startTime
        //                
        //        do {
        //                    try context.save()
        //        } catch {
        //                    print(error)
        //        }
        
    }
}
        

#Preview {
    NewProfileView().environmentObject(ProfileStore())
}
