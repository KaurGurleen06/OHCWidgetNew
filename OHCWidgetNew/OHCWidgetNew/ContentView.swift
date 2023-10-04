//
//  ContentView.swift
//  OHCWidget
//
//  Created by Gurleen Kaur on 04/10/23.
//

import SwiftUI

struct ContentView: View {
    //group.com.philips..OHCWidget

    @AppStorage("emoji", store: UserDefaults(suiteName: "group.com.philips..OHCWidget"))
    var emojiData: Data = Data()

    let emojis = [
        Emoji(icon: "🙂", name: "Happy", description: "The means the user is about that life."),
        Emoji(icon: "😐", name: "Stare", description: "That just happened; right here in front of me.."),
        Emoji(icon: "😠", name: "Heated", description: "Compltely done with your ish Karen!")
    ]
    var body: some View {
        VStack(spacing: 30) {
            ForEach(emojis) { emoji in
                EmojiView(emoji: emoji)
                    .onTapGesture {
                        save(emoji)
                    }
            }
        }
    }

    func save(_ emoji: Emoji) {
        guard let emojiData = try? JSONEncoder().encode(emoji) else { return }
        self.emojiData = emojiData
        print("save \(emoji)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

