//
//  KontaktCell.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct ContactCell: View {
    var body: some View {
        NavigationLink(destination: EmptyView()) {
            HStack{
                Image("img4")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .cornerRadius(20)
                VStack(alignment:.leading){
                    Text("Toshbaqa")
                    Text("oxirgi marta: 5 daqiqa oldin")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContactCell()
}
