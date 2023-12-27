//
//  Royhat.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

struct Royhat: View {
    @State var text = "Barchasi"
    @State var ist = false
    var body: some View {
        if ist{
            Button(action: {
                ist = true
            }, label: {
                VStack(spacing:5){
                    Text(text)
                    Text("")
                        .frame(width: 70,height: 5)
                        .background(.blue)
                        .cornerRadius(3.0)
                }
            })
        }else{
            Button(action: {
                ist = false
            }, label: {
                VStack(spacing:5){
                    Text(text).foregroundColor(.black)
                    Text("")
                        .frame(width: 70,height: 5)
                        .background(.white)
                        .cornerRadius(3.0)
                }
            })
        }
        
    }
}

#Preview {
    Royhat()
}
