//
//  My_Widget.swift
//  My-Widget
//
//  Created by Gurleen Kaur on 04/10/23.
//

import WidgetKit
import SwiftUI

struct EmojiEntry: TimelineEntry {
    let date = Date()
    let emoji: Emoji
}

struct Provider: TimelineProvider {

    @AppStorage("emoji", store: UserDefaults(suiteName: "group.com.philips..OHCWidget"))
    var emojiData: Data = Data()

    func placeholder(in context: Context) -> EmojiEntry {
        let emoji = Emoji(icon: "🤗", name: "Dummy", description: "Dummy")
        return EmojiEntry(emoji: emoji)
    }

    func getSnapshot(in context: Context, completion: @escaping (EmojiEntry) -> Void) {
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
        let entry = EmojiEntry(emoji: emoji)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<EmojiEntry>) -> Void) {
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }

        let entry = EmojiEntry(emoji: emoji)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct PlaceholderView: View {
    var body: some View {
        EmojiView(emoji: Emoji(icon: "😶", name: "N/A", description: "N/A"))
    }
}

struct WidgetEntryView: View {

    let entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    var body: some View {
        EmojiView(emoji: entry.emoji)
    }
}

//@main
struct MyWidget: Widget {
    private let kind = "My_Widget"

    var body: some WidgetConfiguration {
           StaticConfiguration(
               kind: kind,
               provider: Provider()
           ){ entry in
               WidgetEntryView(entry: entry)
           }
           .supportedFamilies([ .systemMedium])
//           .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}


