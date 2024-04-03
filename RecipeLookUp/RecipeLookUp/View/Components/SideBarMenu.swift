//
//  SideBarMenu.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

struct SideBarMenu: View {
    @StateObject var mealViewModel = MealViewModel.shared
    
    var body: some View {
           List(sideMenuItems) { item in
               NavigationLink(
                   destination: destinationView(for: item),
                   label: {
                       Label(
                           title: { Text(item.name) },
                           icon: { Image(systemName: item.icon).foregroundStyle(.white) }
                       )
                       .foregroundColor(.primary)
                   }
               )
               .onAppear{
                   mealViewModel.fetchAllMeals()
               }
           }
           .navigationTitle("Discover")
       }
    
    func destinationView(for item: SideMenuItems) ->  some View {
           switch item.name {
           case "All Meals":
               return AnyView(AllMealsView())
           case "Per category":
               return AnyView(MealsByCategory())
           case "Alphabetic order":
               return AnyView(AlphabeticOrderMeal())
           case "Random meal":
                   return AnyView(MealDetail(meal: mealViewModel.meals.randomElement() ??  Meal(idMeal: "1", strMeal: "Spaghetti Carbonara", strInstructions: "Cook pasta according to package instructions. In a separate bowl, whisk together eggs, cheese, salt, and pepper. In a pan, cook pancetta until crispy. Add cooked pasta to pan with pancetta and toss. Remove from heat and quickly stir in egg mixture. Serve immediately.", strMealThumb: "https://www.example.com/spaghetti_carbonara.jpg", strTags: "Italian,Pasta", strYoutube: "https://www.youtube.com/watch?v=_kw8D1X5pR0", strIngredient1: "Spaghetti", strIngredient2: "Pancetta", strIngredient3: "Eggs", strIngredient4: "Parmesan cheese", strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "200g", strMeasure2: "150g", strMeasure3: "2", strMeasure4: "50g", strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)
                                            ))
           default:
               return AnyView(EmptyView())
           }
       }
}

#Preview {
    SideBarMenu()
}
