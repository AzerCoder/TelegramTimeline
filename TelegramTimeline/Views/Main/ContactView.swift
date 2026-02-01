//
//  KontaktView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 27/12/23.
//

import SwiftUI

struct ContactView: View {
    @State private var searchText = ""
    var body: some View {
        List{
            Button(action: {
                
            }, label: {
                HStack{
                    Image(systemName: "person.badge.plus")
                    Text("Tanishlarni taklif qilish")
                }.foregroundColor(.blue).frame(height:35)
            })
            ForEach(0 ..< 50) { item in
                ContactCell()
            }
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Menu {
                    Button {
                        
                    } label: {
                        Text("by Last Seen")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("by Name")
                    }
                } label: {
                    Text("Sort")
                }

            }
            
            ToolbarItem(placement: .principal) {
                Text("Contacts")
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Search")
    }
}

#Preview {
    NavigationView {
        ContactView()
    }
}
