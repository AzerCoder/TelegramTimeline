//
//  Items.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

struct Items: View {
    var body: some View {
        HStack{
            Image("img2").resizable().frame(width: 70,height: 70)
                .cornerRadius(35)
            VStack(alignment:.leading){
                Text("Pdp Academy")
                Text("hyfdxrdctfvygubhnj").foregroundStyle(.secondary)
            }
            Spacer()
            VStack{
                Text("17:54")
                Text("45").foregroundColor(.white)
                    .frame(width: 30,height: 20)
                    .background(.blue)
                    .cornerRadius(15)
            }
        }.frame(height: 70)
    }
}

#Preview {
    Items()
}
