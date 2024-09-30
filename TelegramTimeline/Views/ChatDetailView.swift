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
    @State private var lineCount: Int = 1
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
                HStack(alignment:.bottom)  {
                    Button {
                        
                    } label: {
                        Image(systemName: "paperclip")
                            .imageScale(.large)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack{
                        
                        TextEditor(text: $messageText)
                            .frame(maxHeight: 200)
                            .frame(height: CGFloat(lineCount) * 24)
                            
                            .onChange(of: messageText) { newValue in
                                // Qatorlar sonini hisoblash
                                let textHeight = newValue.heightWithConstrainedWidth(width: UIScreen.main.bounds.width - 200, font: UIFont.systemFont(ofSize: 18))
                                lineCount = max(1, Int(textHeight / 24)) 
                            }
                        
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
                        .frame(maxHeight: 200)
                        .frame(height: CGFloat(lineCount) * 24)
                        .frame(maxWidth: .infinity)
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


extension String {
    // Matnning balandligini hisoblash uchun yordamchi funksiya
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }
}
