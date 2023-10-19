//
//  Profile.swift
//  TempApp1
//
//  Created by Anya Li on 10/19/23.
//



import SwiftUI
import Foundation

struct Profile: View {
    @Environment(\.managedObjectContext) var context
    @State private var showNewTask = false
//    @FetchRequest(
//        entity: Profile1.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \Profile1.id, ascending: false) ])
    
    //var profileItems: FetchedResults<Profile1>
    let dateFormatter = DateFormatter()
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack {
                HStack{
                    
                    Text("Profile")
                        .font(.custom("KosugiMaru-Regular", size: 40))
                        .fontWeight(.black)
                    Spacer()
                    
                    NavigationLink("edit"){
                        NewProfileView()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)
                        
                    }
                    .foregroundColor(Color.black)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hex: "8b9475"))
                    .cornerRadius(10)
                                        
                }
                .padding()
                Spacer()
                List {
//                    ForEach(profileItems) { profileItem in
//                        let name = profileItem.name ?? "No name"
//                        let title = profileItem.title ?? "No title"
//                        
//                        let display = name + "\n" + title
//                        Text(display)
//                            .font(.custom("KosugiMaru-Regular", size: 20))
////                        let dateFormatter = DateFormatter()
////                        dateFormatter.dateStyle = .medium
////                        dateFormatter.timeStyle = .short
//                                                
////                        print(dateFormatter.string(from:                         profileItems.startTime)) // December 31
////
////                        Text(dateFormatter.string(from:                         profileItems.startTime))
////                            .font(.custom("KosugiMaru-Regular", size: 20))
//                    }
//                    .onDelete(perform: deleteTask)
//                    
                    
                }
                // .listStyle(.plain)
                
                
            }
        }
        
        if showNewTask {
            NewProfileView()
        }
    
        
        //        }
        
    }
//    private func deleteTask(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { profileItems[$0] }.forEach(context.delete)
//            
//            do {
//                try context.save()
//            } catch {
//                print(error)
//            }
//        }
//        
//    }
}

#Preview {
    Profile()
}
