//
//  ContentView.swift
//  food
//
//  Created by Joshua Johnson on 2/14/23.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Text("All Recipes")
                    .padding(.top, 40)
                    .font(.largeTitle)
                    .bold()
                
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                label: {
                                    HStack(spacing: 20) {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        VStack(alignment: .leading) {
                                            Text(r.name)
                                                .foregroundColor(.black)
                                                .bold()
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                            )
                        }
                    }
                }
            }.navigationBarHidden(true)
                .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
