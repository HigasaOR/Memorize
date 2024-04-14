//
//  ContentView.swift
//  Memorize
//
//  Created by Chien Lee on 2024/4/9.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    
    @State var curEmojiKey = "vehicle"
        
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
        }
        .padding()
    }
     
    var cards: some View {
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fill)
            }
        }
        .foregroundColor(.orange)
    }
    
}

struct CardView: View {
    let content: String
    @State var isFacedUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            // upface
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFacedUp ? 1 : 0)
            
            // downface
            base.fill().opacity(isFacedUp ? 0 : 1)
        }

        .onTapGesture {
            isFacedUp.toggle()
        }
        
    }
}

#Preview {
    ContentView()
}
