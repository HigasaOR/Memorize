//
//  ContentView.swift
//  Memorize
//
//  Created by Chien Lee on 2024/4/9.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    
    let emojiDict: [String: [String]] = [
        "vehicle": ["🚗", "🚗", "🚃", "🚃", "⛵️", "⛵️", "✈️", "✈️"],
        "fruit": ["🍎", "🍎", "🍌", "🍌", "🍍", "🍍", "🍉", "🍉"],
        "ball": ["🏀", "🏀", "⚽️", "⚽️", "🏐", "🏐", "⚾️", "⚾️"],
    ]
    
    let themeColor: [String: Color] = [
        "vehicle": .pink,
        "fruit": .green,
        "ball": .orange,
    ]
    
    @State var curEmojiKey = "vehicle"
        
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            themeSelectors
        }
        .padding()
    }
     
    var cards: some View {
        let color = themeColor[curEmojiKey]!
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            let curThemeEmojis = emojiDict[curEmojiKey]!.shuffled()
            ForEach(0..<curThemeEmojis.count, id: \.self){ index in
                CardView(content: curThemeEmojis[index])
                    .aspectRatio(2/3, contentMode: .fill)
            }
        }
        .foregroundColor(color)
    }
    
    var themeSelectors: some View {
        HStack(spacing: 30) {
            vehicleThemeSelector
            fruitThemeSelector
            ballThemeSelector
        }
    }
    
    func themeSelector(key inputKey: String, symbol: String, text: String) -> some View{
        Button(action: {
            curEmojiKey = inputKey
        }, label: {
            VStack {
                Image(systemName: symbol).font(.largeTitle)
                Spacer()
                Text(text)
            }
        })
        .frame(width: 80, height: 70, alignment: .bottom)
    }
    
    var vehicleThemeSelector: some View {
        themeSelector(key: "vehicle", symbol: "car.fill", text: "vehicles")
    }
    
    var fruitThemeSelector: some View {
        themeSelector(key: "fruit", symbol: "carrot.fill", text: "fruits")
    }
    
    var ballThemeSelector: some View {
        themeSelector(key: "ball", symbol: "basketball.fill", text: "balls")
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
