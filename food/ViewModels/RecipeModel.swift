//
//  RecipeModel.swift
//  food
//
//  Created by Joshua Johnson on 2/14/23.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // Parse the local json file
        self.recipes = DataService.getLocalData()
    }
}
