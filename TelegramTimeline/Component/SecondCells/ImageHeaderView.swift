//
//  SettingCell.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct ImageHeaderView: View {
    @Binding var scrollOffset:CGFloat
    @Namespace var namespace
    @State private var imageSize:CGSize = CGSize(width: 90, height: 90)
    @State private var isLargeImage:Bool = false
    var body: some View {
        let layout:AnyLayout = isLargeImage ? AnyLayout(ZStackLayout(alignment: .bottomLeading)) : AnyLayout(VStackLayout())
        layout{
            Image("img1")
                .resizable()
                .frame(width:imageSize.width ,height: imageSize.height)
                .cornerRadius(isLargeImage ? 0 : 50)
                .padding(.top, isLargeImage ? 16 : 0)
            
            VStack(alignment: isLargeImage ? .leading : .center) {
                if scrollOffset <= 60 {
                    Text("A'zamjon Abdumuxtorov")
                        .font(.title)
                        .foregroundColor(isLargeImage ? .white : .primary)
                        .matchedGeometryEffect(id: "fullname", in: namespace)
                }else{
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 30)
                }
                
                Text("+998 93 998 99 80  @Azamjon_Abdumuxtorov")
                    .font(.subheadline)
                    .foregroundColor(isLargeImage ? .white : .secondary)
                    .lineLimit(1)
            }
            .padding(isLargeImage ? 10 : .zero)
        }
        .frame(height: isLargeImage ? UIScreen.main.bounds.width + 100 : 150)
        .padding(.top, isLargeImage ? 34 : 0)
        .offset(y: isLargeImage ? 20 : 0)
        .animation(.easeInOut, value: scrollOffset)
        .onChange(of: scrollOffset) {newValue in
            changeImageSize()
        }
        .onChange(of: isLargeImage) { newValue in
            if newValue{
                imageSize.height = UIScreen.main.bounds.width
                imageSize.width = UIScreen.main.bounds.width
            }else{
                imageSize.height = 90
                imageSize.width = 90
            }
            
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
        }
        .onAppear{
            isLargeImage = false
        }
        .onDisappear{
            isLargeImage = false
        }
    }
    
    func changeImageSize(){
            
        if scrollOffset <= -90 && !isLargeImage{
            isLargeImage = true
        }
        
        if scrollOffset >= -20 && isLargeImage{
            isLargeImage = false
        }
        
    }
}

#Preview {
    NavigationView {
        SettingView()
    }
}


