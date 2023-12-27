//
//  KontaktCell.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct KontaktCell: View {
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Image("img5")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .cornerRadius(20)
                VStack(alignment:.leading){
                    Text("Mushuk")
                    Text("Online").font(.system(size: 16))
                        .foregroundColor(.blue)
                }.frame(height: 35)
            }
           
            HStack{}.frame(maxWidth: .infinity,maxHeight:1).background(.gray.opacity(0.3))
            HStack{
                Image("img4")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .cornerRadius(20)
                VStack(alignment:.leading){
                    Text("Toshbaqa")
                    Text("oxirgi marta: 5 daqiqa oldin").font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
            }.frame(height: 35)
            HStack{}.frame(maxWidth: .infinity,maxHeight:1).background(.gray.opacity(0.3))
        }
    }
}

#Preview {
    KontaktCell()
}
