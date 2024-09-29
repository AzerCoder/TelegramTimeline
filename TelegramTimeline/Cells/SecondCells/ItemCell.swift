//
//  ItemCell.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct ItemCell: View {
    var body: some View {
        Form{
            Section {
                Button(action: {
                    
                }, label: {
                    HStack(spacing:12){
                        Image(systemName: "camera.badge.ellipsis")
                            .imageScale(.medium)
                            .frame(width: 30,height: 30)
                            .cornerRadius(8)
                        Text("Profil rasmini o'zgartirish")
                        Spacer()
                       
                    }.foregroundColor(.blue)
                })
            }
            
            Section {
                SectionRow(imageName: "person.circle.fill", color: .red, title: "Profilim", view: EmptyView())
            }
            Section {
                SectionRow(imageName: "wallet.bifold.fill", color: .blue, title: "Hamyon", view: EmptyView())
            }
            
            Section{
                SectionRow(imageName: "bookmark.fill", color: .blue, title: "Saqlangan xabarlar", view: EmptyView())
                SectionRow(imageName: "phone.fill", color: .green, title: "Oxirgi chqiruvlar", view: EmptyView())
                SectionRow(imageName:  "macbook.and.iphone", color: .orange, title: "Qurilmalar",subtitle: "3", view: EmptyView())
                SectionRow(imageName: "folder.fill", color: .blue.opacity(0.7), title: "Chat jildlari",view: EmptyView())
            }
            Section{
                SectionRow(imageName: "bell.badge.fill", color: .red, title: "Bildirishnomalar va ovozlar",view: EmptyView())
                SectionRow(imageName: "lock.fill", color: .gray, title: "Maxfiylik va xavfsizlik",view: EmptyView())
                SectionRow(imageName: "tablecells.fill", color: .green, title: "Ma'lumotlar va xotira",view: EmptyView())
                SectionRow(imageName: "circle.righthalf.filled.inverse", color: .blue, title: "Oxirgi chaqiruvlar",view: EmptyView())
                SectionRow(imageName: "battery.25", color: .orange, title: "Quvvat tejash", subtitle: "O'chiq",view: EmptyView())
                SectionRow(imageName: "globe", color: .purple, title: "Til", subtitle: "O'zbek",view: EmptyView())
            }
            Section{
                SectionRow(imageName: "star.fill", color: .purple.opacity(0.8), title: "Premium",view: EmptyView())
                
            }
            
            Section{
                SectionRow(imageName:  "ellipsis.message.fill", color: .orange, title: "Savol berish",view: EmptyView())
                
                
                SectionRow(imageName: "questionmark.circle.fill", color: .blue.opacity(0.8), title: "Telegram haqida savollar",view: EmptyView())
                SectionRow(imageName: "lightbulb.fill", color: .orange.opacity(0.7), title: "Telegram funksiyalari",view: EmptyView())
            }
        }.listStyle(.sidebar)
        .scrollIndicators(.hidden)
            .listSectionSpacing(20)
        
    }
}
#Preview {
    NavigationView {
        ItemCell()
    }
}


struct SectionRow<Destination: View>:View {
    let imageName:String
    let color:Color
    let title:String
    var subtitle:String = ""
    var accent:Color = .white
    var view:Destination
    var body: some View {
        NavigationLink {
            view
        } label: {
            HStack(spacing:12){
                Image(systemName: imageName)
                    .imageScale(.medium)
                    .frame(width: 30,height: 30)
                    .foregroundColor(accent)
                    .background(color)
                    .cornerRadius(8)
                Text(title)
                Spacer()
                Text(subtitle)
                    .foregroundColor(.secondary)
            }
        }
    }
}
