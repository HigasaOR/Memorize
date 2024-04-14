//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Chien Lee on 2024/4/14.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    
    private static func creeateMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 16) { pairIndex in
            if (emojis.indices.contains(pairIndex)) {
                return emojis[pairIndex]
            } else {
                return "⁉️" 
            }
            
        }
    }
    
    @Published private var model: MemoryGame<String> = creeateMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
