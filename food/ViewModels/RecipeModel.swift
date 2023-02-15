//
//  RecipeModel.swift
//  food
//
//  Created by Joshua Johnson on 2/14/23.
//

import Foundation

class RecipeModel: ObservableObject {
    // Published makese the list, or init function, refresh on list update
    // Broadcasts changes
    @Published var recipes = [Recipe]()
    
    init() {
        // Get the path to the json file within the app bundle
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        if let path = pathString {
            // Create a url object
            let url = URL(fileURLWithPath: path)
            
            // Error handling
            do {
                // Put the code that potentially throws an error
                // Create a data object with the data at the url
                let data = try Data(contentsOf: url)
                
                // Parse the data
                let decoder = JSONDecoder()
                do {
                    let recipeData = try decoder.decode([Recipe].self, from: data)
                } catch {
                    // Could not decode JSON
                    print(error)
                }
            } catch {
                // Execution will come here if an error is thrown
                // Handle the error
                print(error)
            }
        }
    }
    
    func addRecipe() {
        recipes.append(Recipe(name: "Burger", cuisine: "American"))
    }
}
