//
//  MemoryGame.swift
//  Memorize
//
//  Created by Chien Lee on 2024/4/14.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex+1)a", content: content))
            cards.append(Card(id: "\(pairIndex+1)b", content: content))
        }
    }
    
    var indexOfTheOneAndOnlyFacedUpCard: Int? {
        get {
            return cards.indices.filter { index in cards[index].isFacedUp }.only
        }
        set {
            cards.indices.forEach { index in cards[index].isFacedUp = (index == newValue) }
        }
    }
    
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFacedUp && !cards[chosenIndex].isMatched {
            // only if card is not faced up and not matched
                if let potentialMatchIndex = indexOfTheOneAndOnlyFacedUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[potentialMatchIndex].isMatched = true
                        cards[chosenIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFacedUpCard = chosenIndex
                }
                cards[chosenIndex].isFacedUp = true 
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible { 
        var id: String
        var isFacedUp = false
        var isMatched = false
        var content: CardContent
        
        var debugDescription: String {
            "\(id) \(content) \(isFacedUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
