//
//  DataService.swift
//  food
//
//  Created by Joshua Johnson on 2/16/23.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {
        // Parse local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Get a url path to the json file
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            let recipeData = try decoder.decode([Recipe].self, from: data)
            
            do {
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    // For each ingredient inside of a recipe, we need to set an ID
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        return [Recipe]()
    }
}
