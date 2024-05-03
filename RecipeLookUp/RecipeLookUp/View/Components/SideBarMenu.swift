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
                   return AnyView(RandomMeal())
           default:
               return AnyView(EmptyView())
           }
       }
}

#Preview {
    SideBarMenu()
}
