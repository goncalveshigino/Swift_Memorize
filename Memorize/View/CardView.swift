//
//  CardView.swift
//  Memorize
//
//  Created by Goncalves Higino on 11/02/24.
//

import SwiftUI

struct CardView: View {
    
    typealias Card = MemoryGame<String>.Card
    
    var card: MemoryGame<String>.Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constant.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constant.FontSize.largest))
                    .minimumScaleFactor(Constant.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constant.Pie.insert)
            )
            .padding(Constant.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constant {
        
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let insert: CGFloat = 5
        }
        
    }
}

#Preview {
   // typealias Card = MemoryGame<String>.Card
    
    VStack {
        HStack {
            CardView(MemoryGame<String>.Card(isFaceUp: true, content: "X", id: "2552552"))
            CardView(MemoryGame<String>.Card(content: "X", id: "2552552"))
        }
        
        HStack {
            CardView(MemoryGame<String>.Card(isFaceUp: true, isMatched: true, content: "Xgxhxghxzxghgxhgxhzghzgz", id: "2552552"))
            CardView(MemoryGame<String>.Card(isMatched: true,content: "X", id: "2552552"))
        }
    }
    .padding()
    .foregroundStyle(.green)
}


