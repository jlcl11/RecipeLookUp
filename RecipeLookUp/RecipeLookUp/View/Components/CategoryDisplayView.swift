//
//  CategoryDisplayView.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 15/4/24.
//

import SwiftUI

struct CategoryDisplayView: View {
    let category: Category
    let allMeals: [Meal]
    
    var categoryMeals: [Meal] {
        return allMeals.filter { $0.strCategory == category.strCategory }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                AsyncImage(url: URL(string: category.strCategoryThumb)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .clipped()
                            .cornerRadius(10)
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                    ForEach(categoryMeals, id: \.idMeal) { meal in
                        MealPreview(meal: meal).padding(.top)
                    }
                }
              //  .padding(.horizontal)
            }
            .toolbar {
                       ToolbarItemGroup(placement: .navigationBarLeading) {
                           VStack(alignment:.leading) {
                               Text("\(category.strCategory)")
                                   .font(.largeTitle)
                                   .bold()
                               Text("\(categoryMeals.count) meals")
                                   .foregroundStyle(.tertiary)
                           }
                       }
                   }
                   .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
