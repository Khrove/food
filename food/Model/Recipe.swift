//
//  Recipe.swift
//  food
//
//  Created by Joshua Johnson on 2/14/23.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    var id = UUID()
    var name: String = ""
    var cuisine: String = ""
}
