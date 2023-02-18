//
//  Recipe.swift
//  food
//
//  Created by Joshua Johnson on 2/14/23.
//

import Foundation

class Recipe: Identifiable, Decodable {
    // Optional property, will be nil by default
    var id: UUID?
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var ingredients: [String]
    var directions: [String]
}
