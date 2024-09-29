//
//  SettingView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct SettingView: View {
    @Binding var selection:Int
    @State var searchTeam = ""
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green.opacity(0.5),.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                SettingCell()
                ItemCell()
                
            }
            .navigationBarItems(
                leading:  Button(action: {
                    
                }, label: {
                    Image(systemName: "qrcode")
                        .imageScale(.medium)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(.white.opacity(0.25))
                        .mask(Circle())
                })
                ,
                trailing: HStack{
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
                    
                    
                })
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    toollbarView
                }
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
