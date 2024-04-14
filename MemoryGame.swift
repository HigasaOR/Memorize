//
//  MemoryGame.swift
//  Memorize
//
//  Created by Chien Lee on 2024/4/14.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card){
        
    } 
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
