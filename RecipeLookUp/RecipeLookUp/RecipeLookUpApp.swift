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
            ContentView()
        }
        
        WindowGroup(id: "Ingredients", for: Meal.self) { mealBinding in
            if let meal = mealBinding.wrappedValue {
                IngredientsModalView(meal: meal)
            }
        }.defaultSize(width: 200, height: 600)

    }
}
