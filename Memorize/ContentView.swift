//
//  ContentView.swift
//  Memorize
//
//  Created by Chien Lee on 2024/4/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFacedUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFacedUp = false
    
    var body: some View {
        ZStack {
            if isFacedUp {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
