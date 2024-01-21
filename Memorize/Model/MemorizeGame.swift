//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Goncalves Higino on 29/09/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
   private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCard: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2,numberOfPairsOfCard) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    //TODO: o que significa pairIndex
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    private func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // FIXME: bogus!
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    
    struct Card: Identifiable, Equatable, CustomStringConvertible {
    
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
        var id: String
        var description: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
    
}
