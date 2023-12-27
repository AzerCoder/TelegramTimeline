//
//  StoryItem.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

struct StoryItem: View {
    var body: some View {
        VStack{
            Image("img5").resizable().frame(width: 70,height: 70)
                .cornerRadius(35)
                .overlay(RoundedRectangle(cornerRadius: 35 ).stroke(.green,lineWidth: 2) )
            Text("Person").font(Font.system(size: 13.5))
        }.padding(.trailing,10).frame(height: 100 )
    }
}

#Preview {
    StoryItem()
}
