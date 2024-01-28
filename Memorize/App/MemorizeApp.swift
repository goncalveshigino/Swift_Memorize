//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Goncalves Higino on 06/09/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
