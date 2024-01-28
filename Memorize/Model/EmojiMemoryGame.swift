//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Goncalves Higino on 29/09/23.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    private static let emojis = ["🤗","🐙","🐤","🌝","😎","🐢","🫥"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCard: 5) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
   @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
