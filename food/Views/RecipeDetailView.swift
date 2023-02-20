//
//  RecipeDetailView.swift
//  food
//
//  Created by Joshua Johnson on 2/16/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach (recipe.ingredients) {
                        item in
                        Text("- " + item.name)
                    }
                }.padding([.leading, .trailing], 10)
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.leading], 5)
                    
                    ForEach (recipe.directions, id:\.self) {
                        item in
                        Text("- " + item)
                            .padding([.leading, .bottom], 5)
                    }
                }.padding([.leading, .trailing], 10)
            }
        }.navigationTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
