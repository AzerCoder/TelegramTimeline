//
//  SettingView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct SettingView: View {
    @State private var scrollOffset: CGFloat = 0
    @Namespace var namespace: Namespace.ID
    var body: some View {
        ZStack(alignment: .top) {
            TrackableScrollView(scrollOffset: $scrollOffset) {
                
                VStack(spacing: 25) {
                    
                    ImageHeaderView(scrollOffset: $scrollOffset,namespace: _namespace)
                       
                    
                    CustomSection{
                        Button(action: {
                            
                        }, label: {
                            HStack(spacing:12){
                                Image(systemName: "camera.badge.ellipsis")
                                    .imageScale(.medium)
                                    .frame(width: 30,height: 30)
                                    .cornerRadius(8)
                                Text("Profil rasmini o'zgartirish")
                                Spacer()
                                
                            }.foregroundColor(.blue)
                        })
                    }
                    CustomSection{
                        SectionRow(imageName: "person.circle.fill", color: .red, title: "Profilim")
                    }
                    CustomSection{
                        SectionRow(imageName: "wallet.bifold.fill", color: .blue, title: "Hamyon")
                    }
                    CustomSection{
                        SectionRow(imageName: "bookmark.fill", color: .blue, title: "Saqlangan xabarlar")
                        SectionRow(imageName: "phone.fill", color: .green, title: "Oxirgi chqiruvlar")
                        SectionRow(imageName:  "macbook.and.iphone", color: .orange, title: "Qurilmalar",subtitle: "3")
                        SectionRow(imageName: "folder.fill", color: .blue.opacity(0.7), title: "Chat jildlari")
                    }
                    CustomSection{
                        SectionRow(imageName: "bell.badge.fill", color: .red, title: "Bildirishnomalar va ovozlar")
                        SectionRow(imageName: "lock.fill", color: .gray, title: "Maxfiylik va xavfsizlik")
                        SectionRow(imageName: "tablecells.fill", color: .green, title: "Ma'lumotlar va xotira")
                        SectionRow(imageName: "circle.righthalf.filled.inverse", color: .blue, title: "Oxirgi chaqiruvlar")
                        SectionRow(imageName: "battery.25", color: .orange, title: "Quvvat tejash", subtitle: "O'chiq")
                        SectionRow(imageName: "globe", color: .purple, title: "Til", subtitle: "O'zbek")
                    }
                    CustomSection{
                        SectionRow(imageName: "star.fill", color: .purple.opacity(0.8), title: "Premium")
                    }
                    CustomSection{
                        SectionRow(imageName:  "ellipsis.message.fill", color: .orange, title: "Savol berish")
                        
                        
                        SectionRow(imageName: "questionmark.circle.fill", color: .blue.opacity(0.8), title: "Telegram haqida savollar")
                        SectionRow(imageName: "lightbulb.fill", color: .orange.opacity(0.7), title: "Telegram funksiyalari")
                    }
                }
                .padding(.bottom,20)
                .padding(.top, 20)
            }
            .onChange(of: scrollOffset) { newValue in
                print("Current Scroll Offset: \(newValue)")
            }
            
            CustomSettingNavBar(scrollOffset: $scrollOffset,namespace: _namespace)
        }
        .ignoresSafeArea(edges: .top)
        
    }
}

#Preview {
    NavigationView {
        SettingView()
    }
}

struct CustomSettingNavBar:View {
    var title: String = "A'zamjon Abdumuxtorov"
    @Binding var scrollOffset:CGFloat
    @Namespace var namespace
    
    var threshold: CGFloat = 20
    
    var isVisible: Bool {
        withAnimation {
            return scrollOffset >= threshold
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "qrcode")
                }
                
                Spacer(minLength: 0)
                
                if scrollOffset >= 60 {
                    Text(title)
                        .font(.subheadline)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "fullname", in: namespace)
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Text("Edit")
                }
                
            }
            .animation(.easeInOut, value: scrollOffset)
            .padding(.horizontal)
            .frame(height: 44)
            Divider()
                .opacity(isVisible ? 1 : 0)
        }
        .padding(.top, UIApplication.shared.topSafeArea)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
                .opacity(isVisible ? 1 : 0)
        )
    }
    
}


import SwiftUI

extension UIApplication {
    var currentKeyWindow: UIWindow? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
    
    // Top Safe Area ni oson olish uchun
    var topSafeArea: CGFloat {
        currentKeyWindow?.safeAreaInsets.top ?? 0
    }
}
