//
//  LoginView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 25/01/26.
//

import SwiftUI

struct LoginView: View {
    @State private var phoneNumber: String = ""
    @State private var countryCode: String = "998"
    @State private var syncContacts: Bool = true
    @State private var maxCharacter: Int = 9
    @FocusState private var isFocused: Bool
    var body: some View {
        VStack {
            Text("☎️")
                .font(.system(size: 84))
            
            Text("Your Phone")
                .font(.title)
                .bold()
                .foregroundColor(.primary)
            Text("Please confirm your country code and enter your phone number.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .foregroundColor(.primary)
            
            Divider()
            
            Button {
                
            } label: {
                HStack {
                    Text("🇺🇸")
                    Text("United States")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .imageScale(.small)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .frame(height: 40)
            }
            
            
            Divider()
            
            HStack{
                HStack(spacing:0){
                    Text("+")
                    TextField("", text: $countryCode)
                        .keyboardType(.numberPad)
                        .frame(width: 40)
                        .onChange(of: countryCode) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered.count > 3 {
                                countryCode = String(filtered.prefix(3))
                            } else {
                                countryCode = filtered
                            }
                        }
                }
                
                Divider()
                TextField("000 000 000", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .focused($isFocused)
                    .onChange(of: phoneNumber) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered.count > maxCharacter {
                            phoneNumber = String(filtered.prefix(maxCharacter))
                        } else {
                            phoneNumber = filtered
                        }
                    }
            }
            .padding(.horizontal)
            .frame(height: 40)
            
            Divider()
            
            Toggle("Sync Contacts", isOn: $syncContacts)
                .padding(.horizontal)
            
            
            Spacer()
            
            
        }
        .overlay(alignment: .bottom){
            Button {
                
            } label: {
                Text("Continue")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .foregroundColor(.white)
                    .background{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(phoneNumber.isEmpty ? Color.gray : Color.blue)
                    }
                    .cornerRadius(20)
                    .padding()
            }
        }
        .padding(.horizontal)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isFocused = true
            }
        }
        
    }
}

#Preview {
    LoginView()
}
