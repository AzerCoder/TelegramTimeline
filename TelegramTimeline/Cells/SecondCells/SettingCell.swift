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
                .frame(width: 100,height: 100)
                .cornerRadius(50)
            Text("A'zamjon Abdumuxtorov").font(.title)
            Text("+998 93 998 99 80  @Azamjon_Abdumu...").foregroundColor(.secondary)
        }
    }
}

#Preview {
    SettingCell()
}
