//
//  EmojiView.swift
//  OHCWidget
//
//  Created by Gurleen Kaur on 04/10/23.
//

import SwiftUI

struct EmojiView: View {

    let emoji: Emoji

    var body: some View {
        Text(emoji.icon)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Circle())
    }
}
