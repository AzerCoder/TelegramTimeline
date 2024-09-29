//
//  ChatDetailView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 29/09/24.
//

import SwiftUI

struct ChatDetailView: View {
    let chat: Chat
    @State private var messageText: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image(chat.profileImage)
                .resizable()
                .ignoresSafeArea(.keyboard)
            VStack {
                ScrollView {
                    // Chatning avvalgi xabarlari
                    VStack(alignment: .leading) {
                        Text("Oldingi xabarlar shu yerda ko'rsatiladi...")
                            .padding()
                        Spacer()
                    }
                }
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "paperclip")
                            .imageScale(.large)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        TextField("Xabar", text: $messageText)
                        
                        if !messageText.isEmpty{
                            Image(systemName: "face.smiling")
                                .imageScale(.large)
                                .foregroundColor(.secondary)
                        }else{
                            Image(systemName: "circle")
                                .imageScale(.large)
                                .foregroundColor(.secondary)
                        }
                    }.padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(.white)
                        .cornerRadius(30)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        print("Xabar yuborildi: \(messageText)")
                        messageText = ""
                    } label: {
                        if messageText.isEmpty{
                            Image(systemName: "microphone")
                                .imageScale(.large)
                                .foregroundColor(.secondary)
                                .padding(6)
                        }else{
                            Image(systemName: "arrow.up")
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(.blue)
                                .mask(Circle())
                        }
                    }
                }
                .padding(10)
                .background(Color(.systemGray5))
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack(spacing:0) {
                    Text(chat.name)
                        .font(.headline)
                    Text("yaqinda online edi")
                        .foregroundColor(.secondary)
                        .font(.footnote)
                }
                .padding(.vertical,8)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: HStack{
            Button {
                dismiss()
            } label: {
                
                HStack(spacing:2){
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                    
                    Text("2")
                        .font(.subheadline)
                        .padding(6)
                        .foregroundColor(.white)
                        .background(.blue)
                        .mask(Circle())
                }
            }
            
        },trailing: HStack{
            Image(chat.profileImage)
                .resizable()
                .frame(width: 35,height: 35)
                .mask(Circle())
            
        })
    }
}

#Preview {
    NavigationView {
        ChatDetailView(chat: Chat( id: 1, name: "KING", lastMessage: "Messages", profileImage: "img1"))
    }
}
