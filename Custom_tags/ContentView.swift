//
//  ContentView.swift
//  Custom_tags
//
//  Created by vignesh kumar c on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var tags: [String] = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "nine", "Ten", "Eleven", "Twelve"]
    
    @State private var selectedTags: [String] = []
    var body: some View {
        VStack(spacing: 10) {
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(selectedTags, id: \.self) { tag in
                        TagView(tag: tag, color: .yellow, icon: "checkmark")
                    }
                }
                .padding(.horizontal, 15)
                .frame(height: 35)
                .padding(.vertical, 15)
            }
            .overlay(content: {
                if selectedTags.isEmpty {
                    Text("Select more than 3 tag ")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                }
            })
            .background(Color.white)
            ScrollView(.vertical) {
                TagLayout(alignment: .center, spacing: 10) {
                    ForEach(tags, id: \.self) { tag in
                        TagView(tag: tag, color: .blue, icon: "plus")
                    }
                }
            }
            .background(.black.opacity(0.05))
           
            ZStack {
                Button {
                    
                } label: {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 12)
                            .fill(.pink.gradient))
                }
            }
            .disabled(selectedTags.count < 3)
            .opacity(selectedTags.count < 3 ? 0.5 : 1 )
            .padding()
        }
        .preferredColorScheme(.light)
    }
    
    func TagView(tag: String, color: Color, icon: String) -> some View {
        HStack(spacing: 10) {
            Text(tag)
                .font(.callout)
                .fontWeight(.semibold)
            
            Image(systemName: icon)
        }
        .frame(height: 35)
        .foregroundStyle(.white)
        .padding(.horizontal, 15)
        .background(Capsule().fill(color.gradient))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
