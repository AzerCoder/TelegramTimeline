//
//  AddStory.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

struct AddStory: View {
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image("img1").resizable().frame(width: 70,height: 70).cornerRadius(35)
                Image(systemName: "plus")
                    .frame(width: 24,height: 24)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            Text("A'zamjon").font(Font.system(size: 13.5))
        }.padding(.trailing,10).frame(height: 100)
    }
}

#Preview {
    AddStory()
}
