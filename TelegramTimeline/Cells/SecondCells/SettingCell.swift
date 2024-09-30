//
//  SettingCell.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct SettingCell: View {
    @Binding var scrollOffset:CGFloat
    @Namespace var namespace
    var body: some View {
        VStack{
            Image("img1").resizable()
                .frame(width: 90,height: 90)
                .cornerRadius(50)
            Text("A'zamjon Abdumuxtorov")
                .font(.title)
                .foregroundColor(.white)
                .matchedGeometryEffect(id: "fullname", in: namespace)
            Text("+998 93 998 99 80  @Azamjon_Abdumu...")
                .foregroundColor(.white.opacity(0.65))
        }
        
    }
}

#Preview {
    
    NavigationView {
        SettingView(selection: .constant(2))
    }
    //SettingCell()
       
}
