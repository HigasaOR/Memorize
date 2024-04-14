//
//  MemoryGame.swift
//  Memorize
//
//  Created by Chien Lee on 2024/4/14.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    } 
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card {
        var isFacedUp = true
        var isMatched = false
        var content: CardContent
    }
}
