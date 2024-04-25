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
               return AnyView(CategoriesView())
           case "Alphabetic order":
               return AnyView(AlphabeticOrderMeal())
           case "Random meal":
                   return AnyView(MealDetail(meal: mealViewModel.meals.randomElement() ?? Meal(idMeal: "", strMeal: "", strInstructions: "", strMealThumb: "", strTags: "", strYoutube: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "")))
           default:
               return AnyView(EmptyView())
           }
       }
}

#Preview {
    SideBarMenu()
}
