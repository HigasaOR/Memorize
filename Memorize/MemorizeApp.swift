//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Chien Lee on 2024/4/9.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game: EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
