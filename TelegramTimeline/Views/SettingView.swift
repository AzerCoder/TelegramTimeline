//
//  SettingView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct SettingView: View {
    @Binding var selection:Int
    @State private var scrollOffset: CGFloat = 0
    @Namespace var namespace
    var body: some View {
        ZStack {
            VStack {
                LinearGradient(colors: [.green.opacity(0.5),.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(maxWidth: .infinity)
                    .frame(height: 400 + (scrollOffset > 0 ? scrollOffset : -200),alignment: .top)
                    .edgesIgnoringSafeArea(.top)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section{
                        SettingCell(scrollOffset: $scrollOffset,namespace: _namespace)
                        ItemCell()
                            .frame(height: 950)
                    }
                }
                .background(
                    GeometryReader { geo in
                        Color.clear
                            .onAppear {
                                self.scrollOffset = geo.frame(in: .global).minY
                            }
                            .onChange(of: geo.frame(in: .global).minY) { newValue in
                                print(newValue)
                                withAnimation {
                                    self.scrollOffset = newValue
                                }
                            }
                    }
                )
            }
            .overlay(alignment:.top) {
                if scrollOffset > -80{
                    HStack{
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "qrcode")
                                .imageScale(.medium)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(.white.opacity(0.25))
                                .mask(Circle())
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Tahrir")
                                .foregroundColor(.white)
                                .padding(6)
                                .padding(.horizontal,6)
                                .background(.white.opacity(0.25))
                                .mask(RoundedRectangle(cornerRadius: 20))
                                .font(.subheadline)
                        })
                    }
                    .padding(.horizontal,20)
                }else{
                    HStack{
                        Text("A'zamjon Abdumuxtorov")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .matchedGeometryEffect(id: "fullname", in: namespace)
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color(.secondarySystemBackground))
                    .overlay(alignment: .trailing) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .bold()
                            .padding(.trailing)
                    }
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .bottomBar) {
                toollbarView
            }
        }
    }
}

#Preview {
    NavigationView {
        SettingView(selection: .constant(2))
    }
}


extension SettingView{
    
    private var toollbarView:some View{
        HStack{
            VStack{
                Image(systemName: "person.circle.fill")
                Text("Kontaktlar")
                    .font(.footnote)
            }
            .foregroundColor(.gray)
            .onTapGesture {
                selection = 0
            }
            
            Spacer()
            
            VStack{
                Image(systemName: "message.badge.filled.fill")
                Text("Chatlar")
                    .font(.footnote)
            }
            .foregroundColor(.gray)
            .onTapGesture {
                selection = 1
            }
            
            Spacer()
            VStack{
                Image(systemName: "gear.circle")
                Text("Sozlamalar")
                    .font(.footnote)
            }
            .foregroundColor(.blue)
            .onTapGesture {
                selection = 2
            }
        }
        .padding(.horizontal,20)
    }
}
