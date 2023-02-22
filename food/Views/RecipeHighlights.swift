//
//  RecipeHighlights.swift
//  food
//
//  Created by Joshua Johnson on 2/21/23.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""
    
    init(highlights: [String]) {
        // Loop through the highlights and build the string
        for index in 0..<highlights.count {
            // If this is the last item, dont add a comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 16))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2"])
    }
}
