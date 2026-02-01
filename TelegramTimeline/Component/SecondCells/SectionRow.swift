//
//  ItemCell.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct SectionRow:View {
    let imageName:String
    let color:Color
    let title:String
    var subtitle:String = ""
    var accent:Color = .white
    var body: some View {
        HStack(spacing:12){
            Image(systemName: imageName)
                .imageScale(.medium)
                .frame(width: 30,height: 30)
                .foregroundColor(accent)
                .background(color)
                .cornerRadius(8)
            Text(title)
                .foregroundColor(.primary)
            Spacer()
            Text(subtitle)
                .foregroundColor(.secondary)
        }
    }
}
