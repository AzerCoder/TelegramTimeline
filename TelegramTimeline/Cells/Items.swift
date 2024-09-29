//
//  Items.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

struct Items: View {
    var body: some View {
        NavigationLink(destination: EmptyView()) {
            HStack(alignment:.top){
                Image("img2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60,height: 60)
                    .cornerRadius(35)
                VStack(alignment:.leading){
                    Text("Pdp Academy")
                    Text("hyfdxrdctfvygubhnjjhgdftgyhuji drftgyjuyyu")
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                Spacer()
                VStack{
                    Text("17:54")
                    Text("45").foregroundColor(.white)
                        .frame(width: 30,height: 20)
                        .background(.blue)
                        .cornerRadius(15)
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                
            }.frame(height: 65)
        }
    }
}

#Preview {
    Items()
}
