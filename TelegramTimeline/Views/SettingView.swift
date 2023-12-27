//
//  SettingView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct SettingView: View {
    @State var searchTeam = ""
    var body: some View {
        NavigationView{
                VStack{
                    ItemCell()
                    
                }.navigationBarItems(
                    leading:  Button(action: {
                        
                    }, label: {
                        Image(systemName: "qrcode")
                    })
                    ,
                    trailing: HStack{
                        Button(action: {
                            
                        }, label: {
                            Text("Tahrir")
                        })
                        
                        
                    })
                .navigationBarTitle("",displayMode: .inline)
                .searchable(text: $searchTeam, prompt: "Qidiruv")
                .toolbar{
                    ToolbarItem(placement: .bottomBar){
                        HStack{
                            Spacer()
                            NavigationLink(destination: KontaktView().navigationBarBackButtonHidden(true)) {
                                VStack{
                                    Image(systemName: "person.circle.fill")
                                    Text("Kontaktlar").font(.system(size: 14))
                                }.foregroundColor(.gray)
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
                                }
                            }
                            Spacer()
                        }
                    }
                }
        }.padding(-10)
            
        
    }
}

#Preview {
    SettingView()
}
