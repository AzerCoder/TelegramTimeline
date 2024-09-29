//
//  ContentView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var selection:Int
    @State var segmentSelected = 0
    @State var searchTeam = ""
    @State private var isEditMode: EditMode = .inactive
    let chats = [
        Chat(id: 1, name: "Azamjon", lastMessage: "Salom", profileImage: "img1"),
        Chat(id: 2, name: "Bobur", lastMessage: "Qalesan?", profileImage: "img4"),
        Chat(id: 4, name: "KING", lastMessage: "Qalesan?", profileImage: "img5"),
        Chat(id: 3, name: "Dilshod", lastMessage: "Bormi?", profileImage: "img3"),
    ]
    var body: some View {
        VStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    AddStory()
                    ForEach(0 ..< 10) { item in
                        StoryItem()
                    }
                }.padding(.leading,10)
            }.frame(height: 100)
            
            SegmentControl(isSelected: $segmentSelected)
            
            if segmentSelected == 0 {
                List{
                    ForEach(0 ..< 50) { item in
                        Items()
                    }
                    .onMove(perform: moveItems)
                    .onDelete(perform: deleteItems)
                }
                .transition(.move(edge: .leading))
            }else{
                List{
                    ForEach(chats) { chat in
                        NavigationLink(destination: ChatDetailView(chat: chat)) {
                            HStack {
                                Image(chat.profileImage)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text(chat.name)
                                        .font(.headline)
                                    Text(chat.lastMessage)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            
                        }
                    }
                    .onMove(perform: moveItems)
                    .onDelete(perform: deleteItems)
                    
                }
                .transition(.move(edge: .trailing))
            }
        }
        .searchable(text: $searchTeam, prompt: "Qidiruv")
        .listStyle(.plain)
        .navigationBarItems(
            leading:  Button(action: {
                
            }, label: {
                EditButton()
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
        .environment(\.editMode, $isEditMode)
        .toolbar{
            ToolbarItem(placement: .bottomBar) {
                toolbarView
            }
        }
        .navigationBarTitle("Chatlar",displayMode: .inline)
        
        
    }
    
    // Delete items from the list
    func deleteItems(at offsets: IndexSet) {
        
    }
    
    // Move items within the list
    func moveItems(from source: IndexSet, to destination: Int) {
        
    }
}



#Preview {
    NavigationView {
        ContentView(selection: .constant(0))
    }
}


struct Chat: Identifiable {
    let id: Int
    let name: String
    let lastMessage: String
    let profileImage: String
}

extension ContentView{
    
    private var toolbarView:some View{
        HStack{
            VStack{
                Image(systemName: "person.circle.fill")
                Text("Kontaktlar")
                    .font(.footnote)
            }
            .foregroundColor(.gray)
            .onTapGesture {
                selection = 0
            }
            
            Spacer()
            
            
            VStack{
                Image(systemName: "message.badge.filled.fill")
                Text("Chatlar")
                    .font(.footnote)
            }
            .foregroundColor(.blue)
            .onTapGesture {
                selection = 1
            }
            
            
            Spacer()
            
            
            VStack{
                Image(systemName: "gear.circle")
                Text("Sozlamalar")
                    .font(.footnote)
            }
            .foregroundColor(.gray)
            .onTapGesture {
                selection = 2
            }
        }
        .padding(.horizontal,20)
    }
}
