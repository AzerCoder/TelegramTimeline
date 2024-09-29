//
//  SettingCell.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct SettingCell: View {
    var body: some View {
        VStack{
            Image("img1").resizable()
                .frame(width: 90,height: 90)
                .cornerRadius(50)
            Text("A'zamjon Abdumuxtorov")
                .font(.title)
                .foregroundColor(.white)
            Text("+998 93 998 99 80  @Azamjon_Abdumu...")
                .foregroundColor(.white.opacity(0.65))
        }
    }
}

#Preview {
    SettingCell()
       
}
