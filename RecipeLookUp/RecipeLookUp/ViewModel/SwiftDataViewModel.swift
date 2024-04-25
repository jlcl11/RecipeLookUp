//
//  SwiftDataViewModel.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 23/4/24.
//

import Foundation
import SwiftData

@Observable
final class SwiftDataViewModel: ObservableObject {
    let container = try! ModelContainer(for: Meal.self)
    
    var likedMeals: Set<Meal> = []
    
    @MainActor
    var modelContext: ModelContext {
        container.mainContext
    }
    
    @MainActor
    func getLikedMeals(){
        let fetchDescriptor = FetchDescriptor(predicate: nil, sortBy: [SortDescriptor<Meal>(\.idMeal)])
        likedMeals = Set(try! modelContext.fetch(fetchDescriptor))
    }
    
    @MainActor
    func handleMeal(meal: Meal, isHeartFilled: Bool) {
        isHeartFilled ? insertLikedMeal(meal: meal) : deleteLikedMeal(meal: meal)
    }
    
    @MainActor
    func insertLikedMeal(meal: Meal) {
            modelContext.insert(meal)
            likedMeals = []
            getLikedMeals()
    }
    
    @MainActor
    func deleteLikedMeal(meal: Meal) {
        modelContext.delete(meal)
        
        likedMeals = []
        getLikedMeals()
        try? modelContext.save()
    }
    
    @MainActor
    func isMealFavorite(_ meal: Meal) -> Bool {
        return likedMeals.contains(where: { $0.idMeal == meal.idMeal })
    }
    
}

