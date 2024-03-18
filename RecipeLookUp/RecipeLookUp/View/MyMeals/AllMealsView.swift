//
//  AllMealsView.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

struct AllMealsView: View {
    @State private var searchText: String = ""
    @StateObject var mealViewModel = MealViewModel.shared

    var body: some View {
        ScrollView {
            TextField("Search a meal", text: $searchText)
                .textFieldStyle(.roundedBorder)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                ForEach(mealViewModel.meals.filter {
                    searchText.isEmpty ? true : $0.strMeal.localizedCaseInsensitiveContains(searchText)
                }, id: \.idMeal) { meal in
                    MealPreview(meal: meal)
                        .padding(.vertical)
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
        .onAppear {
            mealViewModel.fetchAllMeals()
        }
    }
}



#Preview {
    AllMealsView()
}
