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
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
     // GET/SET
        /* get {
         
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            } else {
                return nil
            }
        }
        set {
    
           for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
            }
        }*/
        
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    //TODO: o que significa pairIndex
    mutating func choose(_ card: Card) {
        /*if let chosenIndex = index(of: card) {
            cards[chosenIndex].isFaceUp.toggle()
        }*/
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potenialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potenialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potenialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
   /* private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }*/
    
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


extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
