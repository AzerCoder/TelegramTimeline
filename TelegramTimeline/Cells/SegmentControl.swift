//
//  Royhat.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

struct SegmentControl: View {
    @Binding var isSelected:Int
    var body: some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack {
                ForEach(0..<5){ index in
                    Text(segments[index])
                        .font(.callout)
                        .foregroundColor(isSelected == index ? .blue :.secondary)
                        .frame(height: 30)
                        .overlay(alignment:.bottom){
                            if isSelected == index{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(height: 2)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.horizontal,8)
                        .onTapGesture {
                            withAnimation {
                                isSelected = index
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SegmentControl(isSelected: .constant(0))
}

var segments = ["Barchasi","Shaxsiy","Guruhlar","Kanallar","Botlar"]
