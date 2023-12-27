//
//  ItemCell.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct ItemCell: View {
    var body: some View {
       
            List{
                SettingCell()
                Button(action: {
                    
                }, label: {
                    HStack{
                        Image(systemName: "camera.badge.ellipsis")
                            .frame(width: 30,height: 30)
                            .foregroundColor(.blue)
                            .background(.white).cornerRadius(8)
                        Text(" Profil rasmini o'zgartirish")
                            .foregroundColor(.blue)
                    }
                })
                HStack{
                    Image(systemName: "circle.dashed")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.red).cornerRadius(8)
                    Text(" Hikoyalarim")
                    
                }
                HStack{
                    Image(systemName: "bookmark.fill")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.blue).cornerRadius(8)
                    Text(" Saqlangan habarlar")
                    
                }
                HStack{
                    Image(systemName: "phone.fill")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.green).cornerRadius(8)
                    Text(" Oxirgi chaqiruvlar")
                    
                }
                HStack{
                    Image(systemName: "macbook.and.iphone")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.orange).cornerRadius(8)
                    Text(" Qurilmalar")
                    Spacer()
                    Text("2").foregroundColor(.secondary)
                    
                }
                HStack{
                    Image(systemName: "folder.fill")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.blue.opacity(0.7)).cornerRadius(8)
                    Text(" Chat jildlari")
                    
                }
                HStack{
                    Image(systemName: "bell.badge.fill")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.red).cornerRadius(8)
                    Text(" Bildirishnomalar va ovozlar")
                    
                }
                HStack{
                    Image(systemName: "lock.fill")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.gray).cornerRadius(8)
                    Text(" Maxfiylik va xavfsizlik")
                    
                }
                HStack{
                    Image(systemName: "tablecells.fill")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.green).cornerRadius(8)
                    Text(" Ma'lumotlar va xotira")
                    
                }
                HStack{
                    Image(systemName: "circle.righthalf.filled.inverse")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.blue.opacity(0.8)).cornerRadius(8)
                    Text(" Oxirgi chaqiruvlar")
                    
                }
                HStack{
                    Image(systemName: "battery.25")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.orange).cornerRadius(8)
                    Text(" Quvvat tejash")
                    Spacer()
                    Text("O'chiq").foregroundColor(.secondary)
                }
                HStack{
                    Image(systemName: "globe")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.purple).cornerRadius(8)
                    Text(" Til")
                    Spacer()
                    Text("O'zbek").foregroundColor(.secondary)
                }
                HStack{
                    Image(systemName: "star.fill")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.purple.opacity(0.8)).cornerRadius(8)
                    Text(" Premium")
                    
                }
                HStack{
                    Image(systemName: "ellipsis.message.fill")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.orange).cornerRadius(8)
                    Text(" Savol berish")
                    
                }
                HStack{
                    Image(systemName: "questionmark.circle.fill")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.blue.opacity(0.8)).cornerRadius(8)
                    Text(" Telegram haqida savollar")
                    
                }
                HStack{
                    Image(systemName: "lightbulb.fill")
                        .frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .background(.orange.opacity(0.7)).cornerRadius(8)
                    Text(" Telegram funksiyalari")
                    
                }
            
        }
    }
}
#Preview {
        ItemCell()
}
