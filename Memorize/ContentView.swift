//
//  ContentView.swift
//  Memorize
//
//  Created by Goncalves Higino on 06/09/23.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        HStack {
          CardView( isFaceUp: true )
          CardView()
          CardView()
          CardView()
        }
     
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack( alignment: .top, content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius: 12)
                    //.strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10,2]))
                    .strokeBorder(lineWidth: 2)
                Text("🤗").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
          
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

