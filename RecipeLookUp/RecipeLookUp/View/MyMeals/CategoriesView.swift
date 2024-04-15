//
//  MealsByCategory.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

import SwiftUI

struct CategoriesView: View {
    @StateObject var mealViewModel = MealViewModel.shared
    
    var body: some View {
        VStack {
            Text("Categories")
                .font(.extraLargeTitle)
                .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<mealViewModel.categories.count, id: \.self) { index in
                        if index % 4 == 0 {
                            HStack(spacing: 20) {
                                ForEach(index..<min(index + 4, mealViewModel.categories.count), id: \.self) { categoryIndex in
                                    CategoryView(category: mealViewModel.categories[categoryIndex], meals: mealViewModel.meals)
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            mealViewModel.fetchCategories()
        }
    }
}
