//
//  Emoji.swift
//  OHCWidget
//
//  Created by Gurleen Kaur on 04/10/23.
//

import Foundation

struct Emoji: Identifiable, Codable {
    let icon: String
    let name: String
    let description: String

    var id: String { icon }
}
