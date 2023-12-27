//
//  KontaktView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct KontaktView: View {
    @State var searchTeam = ""
    var body: some View {
        NavigationStack{
            List{
                Button(action: {
                    
                }, label: {
                    HStack{
                        Image(systemName: "location")
                        Text("Yaqin atrofdagi odamlarni topish")
                    }.foregroundColor(.blue).frame(height:35)
                })
                Button(action: {
                    
                }, label: {
                    HStack{
                        Image(systemName: "person.badge.plus")
                        Text("Tanishlarni taklif qilish")
                    }.foregroundColor(.blue).frame(height:35)
                })
                VStack{
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    KontaktCell()
                    
                }.padding(.leading,-8).padding(.trailing,-10)
               
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(
                leading:  Button(action: {
                    
                }, label: {
                    Text("Saralash")
                })
                ,
                trailing: HStack{
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                    })
                   
                    
                })
           
            .navigationBarTitle("Kontaktlar",displayMode: .inline)
            .searchable(text: $searchTeam, prompt: "Qidiruv")
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    HStack{
                        Spacer()
                        NavigationLink(destination: KontaktView().navigationBarBackButtonHidden(true)) {
                            VStack{
                                Image(systemName: "person.circle.fill")
                                Text("Kontaktlar").font(.system(size: 14))
                            }
                        }
                       
                        Spacer()
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                            VStack{
                                Image(systemName: "message.badge.filled.fill")
                                Text("Xabarlar").font(.system(size: 14))
                            }.foregroundColor(.gray)
                        }
                        
                        Spacer()
                        NavigationLink(destination: SettingView().navigationBarBackButtonHidden(true)) {
                            VStack{
                                Image(systemName: "gear.circle")
                                Text("Sozlamalar").font(.system(size: 14))
                            }.foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    KontaktView()
}
