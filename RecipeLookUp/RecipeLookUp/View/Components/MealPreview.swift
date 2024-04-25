//
//  MealPreview.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

struct MealPreview: View {
    @State var meal: Meal
    @State private var isHeartFilled = false
    @Environment(SwiftDataViewModel.self) var swiftDataViewModel
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: MealDetail(meal: meal)) {
                ZStack(alignment: .bottom) {
                    HStack {
                        AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                            image
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: 300)
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    HStack(alignment: .center) {
                        Text(meal.strMeal)
                            .bold()
                        Button(action: {
                            isHeartFilled.toggle()
                            swiftDataViewModel.handleMeal(meal: meal, isHeartFilled: isHeartFilled)
                        }) {
                            Label("", systemImage: isHeartFilled ? "heart.fill" : "heart")
                            
                        }.symbolEffect(.bounce.down, value: isHeartFilled)
                            .padding()
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .offset(y: 30)
                }
                .frame(width: 180, height: 250)
                .shadow(radius: 3)
            }
        }
        .onAppear {
            isHeartFilled = swiftDataViewModel.isMealFavorite(meal)
        }
    }
}
 
