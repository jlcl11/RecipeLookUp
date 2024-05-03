//
//  AlphabeticOrderMeal.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

struct AlphabeticOrderMeal: View {
    @State private var searchText: String = ""
    @StateObject var mealViewModel = MealViewModel.shared
    var sortedMealGroups: [Character: [Meal]] {
        var groups: [Character: [Meal]] = [:]
        
        for meal in mealViewModel.meals {
            let initial = meal.strMeal.first ?? "?"
            if groups[initial] != nil {
                groups[initial]?.append(meal)
            } else {
                groups[initial] = [meal]
            }
        }
        
        return groups
    }
    
    var body: some View {
        ScrollView {
            TextField("Search a meal", text: $searchText)
                .textFieldStyle(.roundedBorder)
            
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(sortedMealGroups.keys.sorted(), id: \.self) { initial in
                    VStack(alignment: .leading, spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(String(initial))
                                .font(.headline)
                                .padding(.top)
                            .bold()
                            Divider()
                                .padding(.vertical)
                        }
                        .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 10),
                            GridItem(.flexible(), spacing: 10),
                            GridItem(.flexible(), spacing: 10)
                        ], spacing: 10) {
                            ForEach(sortedMealGroups[initial] ?? [], id: \.idMeal) { meal in
                                if searchText.isEmpty || meal.strMeal.localizedCaseInsensitiveContains(searchText) {
                                    MealPreview(meal: meal)
                                        .padding(.vertical)
                                }
                            }
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                VStack(alignment:.leading) {
                    Text("Meals")
                        .font(.largeTitle)
                        .bold()
                    Text("\(mealViewModel.meals.count) meals")
                        .foregroundStyle(.tertiary)
                }
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    AlphabeticOrderMeal()
}
