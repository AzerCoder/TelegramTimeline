//
//  KontaktView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct ContactView: View {
    @Binding var selection:Int
    @State var searchTeam = ""
    var body: some View {
        List{
            Button(action: {
                
            }, label: {
                HStack{
                    Image(systemName: "person.badge.plus")
                    Text("Tanishlarni taklif qilish")
                }.foregroundColor(.blue).frame(height:35)
            })
            ForEach(0 ..< 50) { item in
                ContactCell()
            }
        }
        .listStyle(.plain)
        .navigationBarItems(
            leading:  HStack{
                Menu {
                    Button(action: {
                        print("Birinchi tanlov tanlandi")
                    }) {
                        Text("Oxirgi faollik asosida")
                    }
                    
                    Button(action: {
                        print("Ikkinchi tanlov tanlandi")
                    }) {
                        Text("Ism bo'yicha")
                    }
                    
                } label: {
                    Text("Saralash")
                }
            }
            ,
            trailing: HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus")
                })
                
                
            })
        .toolbar{
            ToolbarItem(placement: .bottomBar) {
                toolbarView
            }
        }
        .navigationBarTitle("Kontaktlar",displayMode: .inline)
        .searchable(text: $searchTeam, prompt: "Qidiruv")
    }
}

#Preview {
    NavigationView {
        ContactView(selection: .constant(1))
    }
}


extension ContactView{
    private var toolbarView: some View{
        HStack{
            VStack{
                Image(systemName: "person.circle.fill")
                Text("Kontaktlar")
                    .font(.footnote)
            }
            .foregroundColor(.blue)
            .onTapGesture {
                selection = 0
            }
            Spacer()
            
            VStack{
                Image(systemName: "message.badge.filled.fill")
                Text("Chatlar")
                    .font(.footnote)
            }
            .foregroundColor(.gray)
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
