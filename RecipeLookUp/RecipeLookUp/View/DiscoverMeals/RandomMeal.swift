//
//  RandomMeal.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 29/4/24.
//

import SwiftUI

struct RandomMeal: View {
    @Environment(\.openWindow) private var openIngredientsWindow
    @Environment(SwiftDataViewModel.self) var swiftDataViewModel
    @StateObject var mealViewModel = MealViewModel.shared
    @State private var isHeartFilled = false
   
    @State private var meal: Meal?

    var body: some View {
        ZStack() {
            if let meal = meal, let url = URL(string: meal.strMealThumb) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.all)
                    case .failure(let error):
                        Text("Error al cargar la imagen: \(error.localizedDescription)")
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
            }
           
            VStack(alignment:.leading) {
                if let meal = meal {
                    Text(meal.strMeal)
                        .foregroundStyle(.white.gradient)
                        .bold()
                        .font(.system(.extraLargeTitle, design: .rounded))
                        .padding()
                        .cornerRadius(8)
                    
                    HStack {
                        Button(action: {
                            isHeartFilled.toggle()
                            if let mealIndex = mealViewModel.meals.firstIndex(where: { $0.idMeal == meal.idMeal }) {
                                swiftDataViewModel.handleMeal(meal: mealViewModel.meals[mealIndex], isHeartFilled: isHeartFilled)
                            }
                        }) {
                            Label("", systemImage: isHeartFilled ? "heart.fill" : "heart")
                        }
                        .symbolEffect(.bounce.down, value: isHeartFilled)
                        .padding()
                        
                        Button(action: {
                            openIngredientsWindow(id: "Ingredients", value: meal)
                        }) {
                            Label("", systemImage: "carrot")
                        }

                        
                        Button(action: {
                            openIngredientsWindow(id: "Instructions", value: meal)
                        }) {
                            Label("", systemImage: "play.circle")
                        }.padding()
                        
                        Button(action: {
                            openIngredientsWindow(id: "ImageZoomed", value: meal)
                        }) {
                            Label("", systemImage: "magnifyingglass")
                        }
                        .padding(.trailing)
                    }
                }
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .padding()
            .offset(x: 0, y: 200)
            
        }
        .onAppear {
            loadRandomMeal()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    loadRandomMeal()
                }) {
                    Label("Reload", systemImage: "arrow.clockwise")
                }
            }
        }
    }
    
    private func loadRandomMeal() {
        meal = mealViewModel.meals.randomElement()
        isHeartFilled = meal != nil ? swiftDataViewModel.isMealFavorite(meal!) : false
    }
}
