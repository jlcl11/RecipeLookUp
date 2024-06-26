//
//  RecipeLookUpApp.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

@main
struct RecipeLookUpApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(SwiftDataViewModel())
        }
        
        WindowGroup(id: "Ingredients", for: Meal.self) { mealBinding in
            if let meal = mealBinding.wrappedValue {
                IngredientsModalView(meal: meal)
            }
        }.defaultSize(width: 200, height: 600)

        WindowGroup(id: "Instructions", for: Meal.self) { mealBinding in
            if let meal = mealBinding.wrappedValue {
                LetsCookModalView(recipeSteps: meal.strInstructions)
            }
        }
        
        WindowGroup(id: "ImageZoomed", for: Meal.self) { mealBinding in
            if let meal = mealBinding.wrappedValue {
                ImageZoomedModalView(imageString: meal.strMealThumb)
            }
        }.defaultSize(width: 2000, height: 1800)
        
    }
}
