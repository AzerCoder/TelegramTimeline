//
//  ContentView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchTeam = ""
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        AddStory()
                        StoryItem()
                        StoryItem()
                        StoryItem()
                        StoryItem()
                        StoryItem()
                        StoryItem()
                        StoryItem()
                        StoryItem()
                        StoryItem()
                        StoryItem()
                        StoryItem()
                        StoryItem()
                    }
                }.frame(height: 100)
                    .padding(.leading,10)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        Royhat(text: "Barchasi",ist: true)
                        Royhat(text: "Privite")
                        Royhat(text: "Groups")
                        Royhat(text: "Channels")
                        Royhat(text: "Unread")
                        Royhat(text: "Shaxsiy")
                        
                    }.padding(.leading,10)
                }
                List{
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                    Items()
                }.padding(.leading,-10).padding(.trailing,-10)
            }.listStyle(PlainListStyle())
                .navigationBarItems(
                    leading:  Button(action: {
                        
                    }, label: {
                        Text("Tahrir")
                    })
                    ,
                    trailing: HStack{
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus.circle")
                        })
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "square.and.pencil")
                        })
                        
                    })
                .navigationBarTitle("Chatlar",displayMode: .inline)
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
                                }
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
    ContentView()
}
