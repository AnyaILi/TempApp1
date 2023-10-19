
//
//  NewProfileView.swift
//  TempApp
//
//  Created by Anya Li on 9/23/23.
//

import SwiftUI

struct NewProfileView: View {
    @Environment(\.managedObjectContext) var context
    
    @State var title: String=""
    @State var name: String=""
    @State private var selection = "Student"
    @State private var startTime : Date = Date()
    let titles = ["Student", "Office Worker"]
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
                    }
                    
                }
                else if(selection == "Office Worker"){
                    VStack{
                        Text("Work Start Time:")
                        TimePicker(currentDate: $startTime)
                            .padding()
                    }
                    
                }
                NavigationLink("Add"){
                    Homepage(profile: ProfileItem(name: self.name, title: self.title, startTime: self.startTime))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    
                }
                .foregroundColor(Color.black)
                .buttonStyle(.borderedProminent)
                .tint(Color(hex: "F6EFE8"))
                .cornerRadius(10)
//                .simultaneousGesture(TapGesture().onEnded {
//                    self.addTask(name: self.name, title: self.title, startTime: self.startTime)
//                })
                
            
                    }
            }
        }
    private func addTask(name: String, title: String, startTime: Date) {
            
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
    NewProfileView()
}
